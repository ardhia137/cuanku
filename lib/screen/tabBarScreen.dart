import 'package:cuanku/screen/pemasukanScreen.dart';
import 'package:cuanku/theme.dart';
import 'package:cuanku/widget/textFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
               indicatorColor: primaryColor,
              labelColor: primaryColor,
              unselectedLabelColor: Colors.grey,
              tabs: [
                // print(index)
                Tab(
                  child: Text("Pemasukan",style:GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: medium,
                  )),
                  // text: 'asd',
                ),
                Tab(
                   child: Text("Pengeluaran",style:GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: medium,
                  )),
                  // text: 'addd',
                ),
              ],
            ),
            
          ),
        ),
        body: TabBarView(
          children: [
            PemasukanScreen(index: 1,),
            PemasukanScreen(index: 2,),
          ],
        ),
      ),
    );
  }
}
