import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN = "token";
const String id = "id";
const String nip = "nip";
const String tanggal_lahir = "tanggal_lahir";
const String nomor_telepon = "nomor_telepon";
const String email = "email";
const String password = "password";

class PegawaiInfo {
  Future setToken(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(TOKEN, value);
  }

  Future<String?> getToken() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(TOKEN);
  }

  Future setPegawaiID(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(id, value);
  }

  Future<String?> getPegawaiID() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(id).toString();
  }

  Future setNip(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(nip, value);
  }

  Future<String?> getNip() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(nip).toString();
  }

  Future setLahirPGW(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(tanggal_lahir, value);
  }

  Future<String?> getLahirPGW() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(tanggal_lahir).toString();
  }

  Future setNomorTLP(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(nomor_telepon, value);
  }

  Future<String?> getNomorTLP() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(nomor_telepon).toString();
  }

  Future setEmailPGW(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(email, value);
  }

  Future<String?> getEmailPGW() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(email).toString();
  }

  Future setPasswordPGW(String value) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(password, value);
  }

  Future<String?> getPasswordPGW() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(password).toString();
  }

  Future<void> logout() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}