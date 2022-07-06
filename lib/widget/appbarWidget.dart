import 'package:cuanku/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppbarWidget extends StatelessWidget {
  AppbarWidget({Key? key}) : super(key: key);
  final formatCurrency = new NumberFormat.currency(symbol: "",decimalDigits: 0);
  Future get_Data() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = pref.getInt('saldo');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // print(get_Data());
    return Container(
      // height: 135,
      width: MediaQuery.of(context).size.width,
      color: primaryColor,
      padding: const EdgeInsets.only(top: 40, bottom: 17, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Saldo anda",
            style: secondaryTextStyle2.copyWith(
              fontWeight: medium,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: get_Data(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Text(
                "Rp. ${snapshot.data == null ? '-' : formatCurrency.format(snapshot.data)}",
                style: whiteTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 32,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
