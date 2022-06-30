import 'package:cuanku/cubit/data_cubit.dart';
import 'package:cuanku/model/dataModel.dart';
import 'package:cuanku/services/dataServices.dart';
import 'package:cuanku/theme.dart';
import 'package:cuanku/widget/appbarWidget.dart';
import 'package:cuanku/widget/cardWidget.dart';
import 'package:cuanku/widget/subcardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  
  HomeScreen({Key? key}) : super(key: key);

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
                          child: Text("Data Kosong"),
                          );
                        } else {
                          return ListView.builder(
                      padding: EdgeInsets.only(top: 0),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SubcardWidget(judul: state.data[index].judul,nominal: state.data[index].nominal,kategori: state.data[index].kategori);
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
                DataServices().insertdata();
                // Navigator.pushNamed(context, '/tabbar');
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
