import 'package:cuanku/theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final Function() reset;
  final String nama1;
  final String nama2;
  const ButtonWidget({ this.nama1 = 'Simpan',this.nama2 = 'Reset',required this.reset,required this.onPressed,Key? key }) : super(key: key);

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
          InkWell(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor
              ),
              child: Text(nama1,style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: medium
              ),),
            ),
          ),
          InkWell(
            onTap: reset,
            child: Container(
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
              child: Text(nama2,style: secondaryTextStyle3.copyWith(
                fontSize: 20,
                fontWeight: medium
              ),),
            ),
          ),
        ],
      ),
    );
  }
}