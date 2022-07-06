import 'package:cuanku/cubit/data_cubit.dart';
import 'package:cuanku/model/dataModel.dart';
import 'package:cuanku/screen/detailScreen.dart';
import 'package:cuanku/services/dataServices.dart';
import 'package:cuanku/theme.dart';
import 'package:cuanku/widget/appbarWidget.dart';
import 'package:cuanku/widget/cardWidget.dart';
import 'package:cuanku/widget/subcardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  
  HomeScreen({Key? key}) : super(key: key);
final formatCurrency =
      new NumberFormat.currency(symbol: "", decimalDigits: 0);
  @override
  Widget build(BuildContext context) {
    
    context.read<DataCubit>().getData();
    // context.read<DataCubit>().pengeluaran();
    return Scaffold(
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              AppbarWidget(),
              CardWidget(),
              Container(
                width: 100,
                height: 7,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              BlocBuilder<DataCubit, DataState>(
                builder: (context, state) {
                  if (state is DataSuccess) {
                        if (state.data.length <= 0) {
                          return const Padding(padding: EdgeInsets.only(top: 10),
                          child: Text("Data Kosong", style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                          ),),
                          );
                        } else {
                          return ListView.builder(
                      padding: EdgeInsets.only(top: 0),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(
                                    id: state.data[index].id,
                                    nominal: state.data[index].nominal,
                                    judul: state.data[index].judul,
                                    keterangan: state.data[index].deskripsi,
                                    tanggal: state.data[index].tanggal,
                                    kategori: state.data[index].kategori,
                                    
                                  )));
                          },
                          child: SubcardWidget(judul: state.data[index].judul,nominal: state.data[index].nominal,kategori: state.data[index].kategori)
                          // child: Text(state.data[index].judul,style: secondaryTextStyle3.copyWith(
                          //   fontSize: 40,
                          //   fontWeight: bold
                          // ),),
                        );
                      },
                    );
                        }
                  } else {
                    return Text('error');
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 70,
          height: 70,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                // DataServices().getdatalist();
                // DataServices().insertdata();
                Navigator.pushNamed(context, '/tabbar');
                // Add your onPressed code here!
              },
              backgroundColor: secondaryColor3,
              child: Center(
                  child: const Icon(
                Icons.add,
                size: 40,
              )),
            ),
          ),
        ));
  }
}
