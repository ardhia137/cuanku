import 'package:cuanku/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldWidget extends StatelessWidget {
    final String title;
  final String icon;
  final TextEditingController controller;
  final TextInputType tipe;
  final Function() ontap;
  final bool readonly;
  final bool disable;
  const TextFieldWidget({Key? key,this.readonly = false,this.disable = true,required this.title,required this.icon,required this.controller,this.tipe = TextInputType.text,required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
          keyboardType: tipe,
          onTap: ontap,
          readOnly: readonly,
          enabled: disable,
          controller: controller,
            style: secondaryTextStyle3,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 20),
                child: Image.asset(icon, height: 40),
              ),
              hintText: title,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 2.0,
                ),
              ),
            )));
  }
}
