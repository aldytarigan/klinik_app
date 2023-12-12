import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../pasien/pasien_detail_page.dart';

class PasienUpdateForm extends StatefulWidget {
  final PegPas2 pegpas2;

  const PasienUpdateForm({Key? key, required this.pegpas2}) : super(key: key);

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _normPasienCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tglPasienCtrl = TextEditingController();
  final _telpPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  void initState(){
    super.initState();
    setState(() {
      _normPasienCtrl.text = widget.pegpas2.nomor_rm!;
      _namaPasienCtrl.text = widget.pegpas2.nama!;
      _tglPasienCtrl.text = widget.pegpas2.tanggal_lahir!;
      _telpPasienCtrl.text = widget.pegpas2.nomor_telepon!;
      _alamatPasienCtrl.text = widget.pegpas2.alamat!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Poli"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNomorRM(),
              _fieldNamaPasien(),
              _fieldTglPasien(),
              _fieldTelpPasien(),
              _fieldAlamatPasien(),
              SizedBox(height: 20),
              _tombolUbah(),
            ],
          ),
        ),
      ),
    );
  }

   _fieldNomorRM(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nomor RM"
      ),
      controller: _normPasienCtrl,
    );
  }

  _fieldNamaPasien(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama"
      ),
      controller: _namaPasienCtrl,
    );
  }
  
  _fieldTglPasien(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Tanggal Lahir"
      ),
      controller: _tglPasienCtrl,
    );
  }

  _fieldTelpPasien(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nomor Telepon"
      ),
      controller: _telpPasienCtrl,
    );
  }

  _fieldAlamatPasien(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Alamat"
      ),
      controller: _alamatPasienCtrl,
    );
  }

  _tombolUbah(){
    return ElevatedButton(
      onPressed: (){
        PegPas2 pegpas2 = PegPas2(
          nomor_rm: _normPasienCtrl.text,
          );
        Navigator.push(context, 
          MaterialPageRoute(builder: 
              (context) => PasienDetailPage(pegpas2: pegpas2))
        );
      },
      child: Text("Ubah")
    );
  }
}