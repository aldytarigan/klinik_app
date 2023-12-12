import 'package:dio/dio.dart';
import 'package:klinik_app/helpers/api_client.dart';
import 'package:klinik_app/model/pasien.dart';

class PasienService {
  Future<List<PegPas2>> listPasien() async {
    final Response response = await ApiClient().get('Pasien');
    final List data = response.data as List;
    List<PegPas2> result = data.map((json) => PegPas2.fromJson(json)).toList();
    return result;
  }

  Future<PegPas2> simpan(PegPas2 pegpas2) async {
    var data = pegpas2.toJson();
    final Response response = await ApiClient().post('Pasien', data);
    PegPas2 result = PegPas2.fromJson(response.data);
    return result;
  }

  Future<PegPas2> ubah(PegPas2 pegpas2, String id) async {
    var data = pegpas2.toJson();
    final Response response = await ApiClient().put('Pasien/${id}', data);
    print(response);
    PegPas2 result = PegPas2.fromJson(response.data);
    return result;
  }

  Future<PegPas2> getById(String id) async {
    final Response response = await ApiClient().get('Pasien/${id}');
    PegPas2 result = PegPas2.fromJson(response.data);
    return result;
  }

  Future<PegPas2> hapus(PegPas2 pegpas2) async {
    final Response response = await ApiClient().delete('Pasien/${pegpas2.id}');
    PegPas2 result = PegPas2.fromJson(response.data);
    return result;
  } 
}