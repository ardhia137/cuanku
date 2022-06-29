import 'package:cuanku/theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
    final String title;
  final String icon;
  const TextFieldWidget({Key? key,required this.title,required this.icon,}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
            style: secondaryTextStyle3,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 20),
                child: Image.asset(widget.icon, height: 40),
              ),
              hintText: widget.title,
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
