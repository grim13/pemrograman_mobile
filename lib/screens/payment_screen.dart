import 'package:flutter/material.dart';
import 'package:pemrograman_mobile/models/payment_model.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key});
  static String routeName = '/payment';

  List<PaymentModel> paymentList = [
    PaymentModel(
      id: 1,
      nama: 'Buku Pemrograman Mobile',
      tanggal: DateTime.parse("2023-10-01"),
      jumlah: 100000,
    ),
    PaymentModel(
      id: 2,
      nama: 'Majalah Teknologi',
      tanggal: DateTime.parse("2023-10-01"),
      jumlah: 200000,
    ),
    PaymentModel(
      id: 3,
      nama: 'Koran Pagi',
      tanggal: DateTime.parse("2023-10-01"),
      jumlah: 200000,
    ),
    PaymentModel(
      id: 4,
      nama: 'Koran Pagi 2',
      tanggal: DateTime.parse("2023-10-03"),
      jumlah: 800000,
    ),
  ];

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
                  subtitle: Text('Tanggal: ${payment.tanggal.toLocal()}'),
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
    );
  }
}
