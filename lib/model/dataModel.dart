import 'package:equatable/equatable.dart';

class DataModel extends Equatable{
  DataModel (this.id,this.nominal,this.deskripsi,this.tanggal,this.judul);
  late int id;
  late int nominal;
  late String deskripsi;
  late String tanggal;
  late String judul;
  late String kategori;

  @override
  List<Object> get props => [id,nominal,deskripsi,tanggal,judul,kategori];
  DataModel.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.nominal = map['nominal'];
    this.deskripsi = map['deskripsi'];
    this.tanggal = map['tanggal'];
    this.judul = map['judul'];
    this.kategori = map['kategori'];
  }

  int get _id => id;
  int get _nominal => nominal;
  String get _deskripsi => deskripsi;
  String get _tanggal => tanggal;
  String get _judul => judul;
  String get _kategori => kategori;

  set _nominal(int value){
    nominal = value;
  } 
  set _deskripsi(String value){
    deskripsi = value;
  }
  set _tanggal(String value){
    tanggal = value;
  } 
  set _judul(String value){
    judul = value;
  } 
  set _kategori(String value){
    kategori = value;
  } 
  Map<String,dynamic> toMap(){
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = id;
    map['nominal'] = nominal;
    map['deskripsi'] = deskripsi;
    map['tanggal'] = tanggal;
    map['judul'] = judul;
    map['kategori'] = kategori;
    return map;
  }
  // factory DataModel.toMap(Map<String,Object>map){
  //   var map = <String,Object?>{

  //   }
  //   // return DataModel(json['id'], json['nominal'], json['deskripsi'], json['tanggal'],json['judul']);
  // }
  
  // Map<String, Object?> toMap() {}

}