import 'package:flutter/material.dart';
import 'package:pemrograman_mobile/models/payment_model.dart';
import 'package:pemrograman_mobile/services/request.dart';
import 'dart:convert' as convert;

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key});
  static String routeName = '/payment';
  List<PaymentModel> paymentList = [];
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Future<void> loadPaymentData() async {
    //load payment data from API
    var req = ReqService();
    var reqPayment = await req.get('/payment');
    if (reqPayment.statusCode == 200) {
      widget.paymentList.clear();
      var data = convert.jsonDecode(reqPayment.body);
      for (var item in data) {
        widget.paymentList.add(
          PaymentModel(
            nama: item['nama'].toString(),
            tanggal: item['tanggal'],
            jumlah: int.parse(item['jumlah'].toString()),
            id: item['_id'],
          ),
        );
      }
      setState(() {
        widget.paymentList = widget.paymentList;
      });
    } else {
      print('Failed to load payment data');
    }
  }

  void initState() {
    super.initState();
    loadPaymentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.paymentList.length,
              itemBuilder: (context, index) {
                final payment = widget.paymentList[index];
                return ListTile(
                  title: Text(payment.nama),
                  subtitle: Text('Tanggal: ${payment.tanggal}'),
                  trailing: Text(
                    '${payment.jumlah}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/payment/add');
          // Refresh the UI
        },
      ),
    );
  }
}
