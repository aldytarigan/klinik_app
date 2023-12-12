import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN = "token";
const String id = "id";
const String nomor_rm = "nomor_rm";
const String nama = "nama";
const String tanggal_lahir = "tanggal_lahir";
const String nomor_telepon = "nomor_telepon";
const String alamat = "alamat";

class PasienInfo {
  Future setToken(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(TOKEN, value);
  }

  Future<String?> getToken() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(TOKEN);
  }

  Future setPasienID(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(id, value);
  }

  Future<String?> getPasienID() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(id).toString();
  }

  Future setNomorRM(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(nomor_rm, value);
  }

  Future<String?> getNomorRM() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(nomor_rm).toString();
  }

  Future setNamaPSN(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(nama, value);
  }

  Future<String?> getNamaPSN() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(nama).toString();
  }

  Future setLahirPSN(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(tanggal_lahir, value);
  }

  Future<String?> getLahirPSN() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(tanggal_lahir).toString();
  }

  Future setNoTelp(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(nomor_telepon, value);
  }

  Future<String?> getNoTelp() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(nomor_telepon).toString();
  }

  Future setAlamat(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(alamat, value);
  }

  Future<String?> getAlamat() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(alamat).toString();
  }

  Future<void> logout() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}