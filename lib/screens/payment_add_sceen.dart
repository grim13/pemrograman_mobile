import 'package:flutter/material.dart';
import 'package:pemrograman_mobile/services/request.dart';

class PaymentAddSceen extends StatelessWidget {
  static String routeName = '/payment/add';
  const PaymentAddSceen({super.key});

  Future<void> simpanData(
    BuildContext context,
    String namaPembayaran,
    jumlahPembayaran,
    tanggalPembayaran,
  ) async {
    // Simpan data ke API
    var req = ReqService();
    var res = await req.post(
      '/payment',
      param: {
        'nama': namaPembayaran,
        'jumlah': jumlahPembayaran,
        'tanggal': tanggalPembayaran,
      },
    );
    print(res.statusCode);
    if (res.statusCode == 201) {
      showDialog<String>(
        context: context,
        builder:
            (BuildContext context) => AlertDialog(
              title: const Text('Berhasil'),
              content: const Text('Data Behasil Disimpan'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    } else {
      showDialog<String>(
        context: context,
        builder:
            (BuildContext context) => AlertDialog(
              title: const Text('Gagal'),
              content: const Text('Data Gagal Disimpan'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final namaPembayaranController = TextEditingController();
    final jumlahPembayaranController = TextEditingController();
    final tanggalPembayaranController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Payment')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Masukkan Nama Pembayaran',
                ),
                controller: namaPembayaranController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Masukkan Jumlah Pembayaran',
                ),
                controller: jumlahPembayaranController,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Masukkan Tanggal Pembayaran',
                ),
                controller: tanggalPembayaranController,
                keyboardType: TextInputType.number,
              ),
            ),
            TextButton(
              onPressed: () {
                // print(nimContoller.text);
                simpanData(
                  context,
                  namaPembayaranController.text,
                  jumlahPembayaranController.text,
                  tanggalPembayaranController.text,
                );
              },
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
