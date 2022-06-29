import 'package:cuanku/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SubcardWidget extends StatelessWidget {
  final String judul;
  final int nominal;
  final String kategori;
  SubcardWidget({required this.judul,required this.nominal,required this.kategori, Key ? key}) : super(key:key);
  final formatCurrency = new NumberFormat.currency(symbol: "",decimalDigits: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13,vertical: 18),
      margin: EdgeInsets.only(left: 15,right: 15,top: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(judul,style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semibold
              ),),
              Text(kategori,style: secondaryTextStyle3.copyWith(
                fontSize: 16,
                fontWeight: medium
              ),),
            ],
          ),
          Row(
            children: [
              Text("Rp. ",style: primaryTextStyle.copyWith(
                fontSize: 22
              ),),
              Text("${formatCurrency.format(nominal)}",style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: bold
              ),)
            ],
          )
        ],
      ),
    );
  }
}