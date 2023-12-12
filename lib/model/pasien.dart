class PegPas2{
  int? id;
  String? nomor_rm, nama, tanggal_lahir, nomor_telepon, alamat;

  PegPas2({this.id, this.nomor_rm, this.nama, this.tanggal_lahir, this.nomor_telepon, this.alamat});

  factory PegPas2.fromJson(Map<String, dynamic> json) => PegPas2(
    id: json["id"], 
    nomor_rm: json["nomor_rm"], 
    nama: json["nama"], 
    tanggal_lahir: json["tanggal_lahir"],
    nomor_telepon: json["nomor_telepon"],
    alamat: json["alamat"]
  );

  Map<String, dynamic> toJson() => {
    "nomor_rm": nomor_rm,
    "nama": nama,
    "tanggal_lahir": tanggal_lahir,
    "nomor_telepon": nomor_telepon,
    "alamat": alamat
  };
}