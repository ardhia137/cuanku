import 'package:cuanku/theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 45,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryColor
            ),
            child: Text("Simpan",style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: medium
            ),),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 45,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: secondaryColor3,
                width: 2
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("Reset",style: secondaryTextStyle3.copyWith(
              fontSize: 20,
              fontWeight: medium
            ),),
          ),
        ],
      ),
    );
  }
}