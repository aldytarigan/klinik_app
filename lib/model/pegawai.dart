class PegPas{
  int? id;
  String? nip, nama, tanggal_lahir, nomor_telepon, email, password;

  PegPas({this.id, this.nip, this.nama, this.tanggal_lahir, this.nomor_telepon, this.email, this.password});

  factory PegPas.fromJson(Map<String, dynamic> json) => PegPas(
    id: json["id"], 
    nip: json["nip"], 
    nama: json["nama"], 
    tanggal_lahir: json["tanggal_lahir"],
    email: json["email"],
    password: json["password"]
  );

  Map<String, dynamic> toJson() => {
    "nip": nip,
    "nama": nama,
    "tanggal_lahir": tanggal_lahir,
    "email": email,
    "password": password
  };
}