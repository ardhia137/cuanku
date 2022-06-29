import 'package:cuanku/widget/buttonWidget.dart';
import 'package:cuanku/widget/textFieldWidget.dart';
import 'package:flutter/material.dart';

class PemasukanScreen extends StatelessWidget {
  const PemasukanScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 65),
        child: Column(
          children: [
            TextFieldWidget(title: 'Nominal',icon: "assets/nominal.png",),
            TextFieldWidget(title: 'Judul',icon: "assets/judul.png",),
            TextFieldWidget(title: 'Keterangan',icon: "assets/keterangan.png",),
            TextFieldWidget(title: 'Tanggal',icon: "assets/tanggal.png",),
            ButtonWidget()
          ],
        ),
        
      ),
    );
  }
}