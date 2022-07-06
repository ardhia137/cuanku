// import 'package:cuanku/cubit/data_cubit.dart';
import 'package:cuanku/cubit/pemasukan_cubit.dart';
import 'package:cuanku/cubit/pengeluaran_cubit.dart';
import 'package:cuanku/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatelessWidget {
  CardWidget({ Key? key }) : super(key: key);
  final formatCurrency = new NumberFormat.currency(symbol: "",decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    context.read<PengeluaranCubit>().pengeluaran();
    context.read<PemasukanCubit>().pemasukan();
    return Container(
      margin: EdgeInsets.only(top: 15,bottom: 10,left: 15,right: 15),
      padding: EdgeInsets.only(top: 20,bottom: 16,left: 15,right: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total",style: secondaryTextStyle2.copyWith(
            fontWeight: medium,
            fontSize: 24
          ),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pengeluaran",style: secondaryTextStyle2.copyWith(
                fontWeight: medium,
                fontSize: 16
              ),),
               Text("Pemasukan",style: secondaryTextStyle2.copyWith(
                fontWeight: medium,
                fontSize: 16
              ),),
            ],
          ),
          SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               BlocBuilder<PengeluaranCubit, PengeluaranState>(
          builder: (context, state) {
            // context.read<DataCubit>().pengeluaran();
            if (state is PengeluaranSuccess) {
              return Text("Rp. ${formatCurrency.format(state.data)}",style: whiteTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 16
              ),);
            } else {
              return  Text("Rp. -",style: whiteTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 16
              ),);
            }
          },
        ),
              
               BlocBuilder<PemasukanCubit, PemasukanState>(
          builder: (context, state) {
            // context.read<DataCubit>().pengeluaran();
            if (state is GetPemasukanSuccess) {
              print(state);
              return Text("Rp. ${formatCurrency.format(state.data)}",style: whiteTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 16
              ),);
            } else {
              return  Text("Rp. -",style: whiteTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 16
              ),);
            }
          },
        ),
            ],
          )
        ],
      ),
    );
  }
}