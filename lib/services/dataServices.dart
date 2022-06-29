import 'dart:ffi';

import 'package:cuanku/model/dataModel.dart';
import 'package:sqflite/sqflite.dart';

class DataServices {
  Database? db;
  Future open() async {
    db = await openDatabase('cuanku.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''create table data (
    id integer primary key autoincrement,
    nominal integer not null,
    deskripsi varchar(255) not null,
    judul varchar(255) not null,
    kategori varchar(255) not null,
    tanggal varchar(255) not null
  ) ''').then((value) => print("database dibuat")).catchError((error) {
            print('error ketika database dibuat ${error.toString()}');
          });
    });
    return db;
  }

    Future<Database> get database async {
    if (db == null) {
      print(db);
      db = await open();
    }
    return db!;
  }

  Future<List<Map<String, dynamic>>> getdata() async {
    Database? db;
    db = await database;
    var data = await db.query('data');

    return data;
  }

Future<int?> insertdata()async{
  try {
    Database? db = await this.database;
    int? count = await db.insert('data', {
    'nominal':1000,
    'deskripsi':'test',
    'tanggal':'10-10-10',
    'judul':'hanya test',
    'kategori':'pemasukan',

  });
  print(count);
  return count;
  } catch (e) {
    print(e);
  }
}
Future<List<DataModel>> getdatalist() async {
    var dataMapList = await getdata();
    int count = dataMapList.length;
    List<DataModel> datalist = <DataModel>[];
    for (int i=0; i<count; i++) {
      datalist.add(DataModel.fromMap(dataMapList[i]));
    }
    print(datalist);
    return datalist;
  }
Future<Object?> pengeluaran() async{
    Database? db = await this.database;
    var data = await db.rawQuery("select sum(nominal) as pengeluaran from data where kategori = 'pengeluaran'");
    print(data[0]['pengeluaran']);
    return data[0]['pengeluaran'];

}
}


