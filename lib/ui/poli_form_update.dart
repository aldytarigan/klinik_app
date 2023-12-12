import 'package:flutter/material.dart';
import 'package:klinik_app/service/poli_service.dart';
import '../model/poli.dart';
import 'poli_detail_page.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;

  const PoliUpdateForm({Key? key, required this.poli}) : super(key: key);

  @override
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  Future<Poli> getData() async {
    Poli data = await PoliService().getById(widget.poli.id.toString());
    setState(() {
      _namaPoliCtrl.text = data.namaPoli;
    });
    return data;
  }

  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  void initState(){
    super.initState();
    setState(() {
      getData();
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
              _fieldNamaPoli(),
              SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaPoli(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama Poli"
      ),
      controller: _namaPoliCtrl,
    );
  }

  _tombolSimpan(){
    return ElevatedButton(
      onPressed: () async {
        Poli poli = new Poli(namaPoli: _namaPoliCtrl.text);
        String id = widget.poli.id.toString();
        await PoliService().ubah(poli, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context) => PoliDetailPage(poli: value)));
        });
      },
      child: Text("Ubah")
    );
  }
}