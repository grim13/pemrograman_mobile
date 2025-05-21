import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nimContoller = TextEditingController();
  final namaContoller = TextEditingController();
  final prodiContoller = TextEditingController();
  final fakultasContoller = TextEditingController();
  final paContoller = TextEditingController();
  @override
  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nimContoller.text = prefs.getString('nim')!;
    namaContoller.text = prefs.getString('nama')!;
    prodiContoller.text = prefs.getString('prodi')!;
    fakultasContoller.text = prefs.getString('fakultas')!;
    paContoller.text = prefs.getString('pa')!;
  }

  void simpanData(String nim, nama, prodi, fakultas, pa) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nim', nim);
    await prefs.setString('nama', nama);
    await prefs.setString('prodi', prodi);
    await prefs.setString('fakultas', fakultas);
    await prefs.setString('pa', pa);
  }

  void initState() {
    loadData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nim',
              ),
              controller: nimContoller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nama',
              ),
              controller: namaContoller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Prodi',
              ),
              controller: prodiContoller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Fakultas',
              ),
              controller: fakultasContoller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Pembimbing Akademik',
              ),
              controller: paContoller,
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // print(nimContoller.text);
              simpanData(
                nimContoller.text,
                namaContoller.text,
                prodiContoller.text,
                fakultasContoller.text,
                paContoller.text,
              );
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
            },
            child: Text("Simpan"),
          ),
        ],
      ),
    );
  }
}
