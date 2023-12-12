import 'package:flutter/material.dart';
import 'package:klinik_app/pegawai/pegawai_detail_page.dart';
import '../model/pegawai.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tglPegawaiCtrl = TextEditingController();
  final _nomorPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Pegawai"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNipPegawai(),
              _fieldNamaPegawai(),
              _fieldTanggalLahir(),
              _fieldNomor(),
              _fieldEmail(),
              _fieldPassword(),
              SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }
  
  _fieldNipPegawai(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nip"
      ),
      controller: _nipPegawaiCtrl,
    );
  }

  _fieldNamaPegawai(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama"
      ),
      controller: _namaPegawaiCtrl,
    );
  }

  _fieldTanggalLahir(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Tanggal Lahir"
      ),
      controller: _tglPegawaiCtrl,
    );
  }

  _fieldNomor(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nomor Telepon"
      ),
      controller: _nomorPegawaiCtrl,
    );
  }

  _fieldEmail(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Email"
      ),
      controller: _emailPegawaiCtrl,
    );
  }

  _fieldPassword(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Password"
      ),
      controller: _passwordPegawaiCtrl,
    );
  }

  _tombolSimpan(){
    return ElevatedButton(
      onPressed: (){
        PegPas pegpas = PegPas(
          nama: _namaPegawaiCtrl.text,
          nip: _nipPegawaiCtrl.text,
          tanggal_lahir: _tglPegawaiCtrl.text,
          nomor_telepon: _nomorPegawaiCtrl.text,
          email: _emailPegawaiCtrl.text,
          password: _passwordPegawaiCtrl.text,
        );
        Navigator.push(context, 
          MaterialPageRoute(builder: 
              (context) => PegawaiDetailPage(pegpas: pegpas))
        );
      },
      child: Text("Simpan")
    );
  }
}