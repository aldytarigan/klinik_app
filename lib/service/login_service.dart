import 'package:klinik_app/helpers/user_info.dart';

class LoginService {
  Future<bool> login(String username, String password) async{
    bool isLogin = false;
    if(username == 'admin' && password == 'admin'){
      await UserInfo().setToken("admin");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("admin");
      isLogin = true;
    }
    return isLogin;
  }
}

// class LoginServicePegawai {
//   Future<bool> login(String username, String password) async{
//     bool isLogin = false;
//     if(username == 'pegawai' && password == 'pegawai'){
//       await UserInfo().setToken("pegawai");
//       await UserInfo().setUserID("1");
//       await UserInfo().setUsername("pegawai");
//       isLogin = true;
//     }
//     return isLogin;
//   }
// }

// class LoginServicePasien {
//   Future<bool> login(String username, String password) async{
//     bool isLogin = false;
//     if(username == 'pasien' && password == 'pasien'){
//       await UserInfo().setToken("pasien");
//       await UserInfo().setUserID("1");
//       await UserInfo().setUsername("pasien");
//       isLogin = true;
//     }
//     return isLogin;
//   }
//}