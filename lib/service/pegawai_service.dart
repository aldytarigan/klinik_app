import 'package:dio/dio.dart';
import 'package:klinik_app/helpers/api_client.dart';
import 'package:klinik_app/model/pegawai.dart';

class PegawaiService {
  Future<List<PegPas>> listPegawai() async {
    final Response response = await ApiClient().get('Pegawai');
    final List data = response.data as List;
    List<PegPas> result = data.map((json) => PegPas.fromJson(json)).toList();
    return result;
  }

  Future<PegPas> simpan(PegPas pegpas) async {
    var data = pegpas.toJson();
    final Response response = await ApiClient().post('Pegawai', data);
    PegPas result = PegPas.fromJson(response.data);
    return result;
  }

  Future<PegPas> ubah(PegPas pegpas, String id) async {
    var data = pegpas.toJson();
    final Response response = await ApiClient().put('Pegawai/${id}', data);
    print(response);
    PegPas result = PegPas.fromJson(response.data);
    return result;
  }

  Future<PegPas> getById(String id) async {
    final Response response = await ApiClient().get('Pegawai/${id}');
    PegPas result = PegPas.fromJson(response.data);
    return result;
  }

  Future<PegPas> hapus(PegPas pegpas) async {
    final Response response = await ApiClient().delete('Pegawai/${pegpas.id}');
    PegPas result = PegPas.fromJson(response.data);
    return result;
  } 
}