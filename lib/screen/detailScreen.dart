import 'package:cuanku/cubit/data_cubit.dart';
import 'package:cuanku/theme.dart';
import 'package:cuanku/widget/buttonWidget.dart';
import 'package:cuanku/widget/textFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  int id;
  int nominal;
  String judul;
  String keterangan;
  String tanggal;
  String kategori;
  DetailScreen(
      {required this.id,
      required this.nominal,
      required this.kategori,
      required this.judul,
      required this.keterangan,
      required this.tanggal,
      Key? key})
      : super(key: key);
  late TextEditingController nominalController =
      TextEditingController(text: nominal.toString());
  late TextEditingController judulController =
      TextEditingController(text: judul);
  late TextEditingController keteranganController =
      TextEditingController(text: keterangan);
  late TextEditingController tanggalController =
      TextEditingController(text: tanggal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Detail'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 65),
          child: Column(
            children: [
              TextFieldWidget(
                  title: 'Nominal',
                  icon: "assets/nominal.png",
                  controller: nominalController,
                  tipe: TextInputType.number,
                  readonly: true,
                  disable: true,
                  ontap: () {}),
              TextFieldWidget(
                  title: 'Judul',
                  icon: "assets/judul.png",
                  controller: judulController,
                  readonly: true,
                  disable: true,
                  ontap: () {}),
              TextFieldWidget(
                title: 'Keterangan',
                icon: "assets/keterangan.png",
                controller: keteranganController,
                readonly: true,
                disable: true,
                ontap: () {},
              ),
              TextFieldWidget(
                title: 'Tanggal',
                icon: "assets/tanggal.png",
                controller: tanggalController,
                readonly: true,
                disable: true,
                ontap: () {},
              ),
              BlocConsumer<DataCubit, DataState>(listener: (context, state) {
                if (state is DataSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/home", (route) => false);
                }
              }, builder: (context, state) {
                return InkWell(
                  onTap: () => context.read<DataCubit>().hapusdata(
                      nominal: nominalController.text,
                      id: id.toString(),
                      kategori: kategori),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(
                      // horizontal: 45,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      // border: Border.all(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Hapus',
                        style: whiteTextStyle.copyWith(
                            fontSize: 20, fontWeight: medium),
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
