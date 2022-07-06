import 'package:cuanku/cubit/pemasukan_cubit.dart';
import 'package:cuanku/widget/buttonWidget.dart';
import 'package:cuanku/widget/textFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PemasukanScreen extends StatelessWidget {
  final int index;
  PemasukanScreen({required this.index, Key? key}) : super(key: key);
  final TextEditingController nominalController =
      TextEditingController(text: '');
  final TextEditingController judulController = TextEditingController(text: '');
  final TextEditingController keteranganController =
      TextEditingController(text: '');
  TextEditingController tanggalController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 65),
        child: Column(
          children: [
            TextFieldWidget(
                title: 'Nominal',
                icon: "assets/nominal.png",
                controller: nominalController,
                tipe: TextInputType.number,
                ontap: () {}),
            TextFieldWidget(
                title: 'Judul',
                icon: "assets/judul.png",
                controller: judulController,
                ontap: () {}),
            TextFieldWidget(
              title: 'Keterangan',
              icon: "assets/keterangan.png",
              controller: keteranganController,
              ontap: () {},
            ),
            TextFieldWidget(
              title: 'Tanggal',
              icon: "assets/tanggal.png",
              controller: tanggalController,
              ontap: () async {
                DateTime? date = DateTime.now();
                FocusScope.of(context).requestFocus(new FocusNode());

                date = (await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    )) ??
                    DateTime.now();
                String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                tanggalController.text = formattedDate.toString();
              },
            ),
            BlocConsumer<PemasukanCubit, PemasukanState>(
                listener: (context, state) {
              if (state is PemasukanSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", (route) => false);
              }
            }, builder: (context, state) {
              return ButtonWidget(
                reset: () {
                  nominalController.clear();
                  judulController.clear();
                  keteranganController.clear();
                  tanggalController.clear();
                },
                onPressed: () {
                  if (nominalController.text == '' ||
                      judulController.text == '' ||
                      keteranganController.text == '' ||
                      tanggalController.text == '') {
                    final snackBar = SnackBar(
                      content: const Text('Harap Isi Data'),
                      backgroundColor: (Colors.red),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    String kategori = index == 1 ? 'pemasukan' : 'pengeluaran';
                    context.read<PemasukanCubit>().inputpemasukan(
                          nominal: nominalController.text,
                          judul: judulController.text,
                          kategori: kategori,
                          keterangan: keteranganController.text,
                          tanggal: tanggalController.text,
                        );
                  }
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
