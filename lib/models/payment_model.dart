class PaymentModel {
  String? id; //nullable
  String nama;
  String tanggal;
  int jumlah;
  //membuat constructor method
  PaymentModel({
    this.id,
    required this.nama,
    required this.tanggal,
    required this.jumlah,
  });
}
