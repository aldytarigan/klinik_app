import 'package:flutter/material.dart';
import 'package:klinik_app/ui/beranda.dart';
import '../helpers/user_info.dart';
import '../ui/login.dart';
//import 'package:klinik_app/ui/poli_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MaterialApp(
    title: "Klinik App",
    debugShowCheckedModeBanner: false,
    home: token == null ? Login() : Beranda(),
  ));
}