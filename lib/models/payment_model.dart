class PaymentModel {
  int? id; //nullable
  String nama;
  DateTime tanggal;
  int jumlah;
  //membuat constructor method
  PaymentModel({
    this.id,
    required this.nama,
    required this.tanggal,
    required this.jumlah,
  });
}
