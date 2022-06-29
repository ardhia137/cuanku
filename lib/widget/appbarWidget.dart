import 'package:cuanku/theme.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 135,
      width: MediaQuery.of(context).size.width,
      color: primaryColor,
      padding: EdgeInsets.only(top: 40,bottom: 17,left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Saldo anda",style: secondaryTextStyle2.copyWith(
            fontWeight:medium ,
            fontSize: 20,
          ),),
          SizedBox(height: 10,),
          Text("Rp. 20.000,00",style: whiteTextStyle.copyWith(
            fontWeight:semibold,
            fontSize: 32,
          ),),
        ],
      ),
    );
  }
}