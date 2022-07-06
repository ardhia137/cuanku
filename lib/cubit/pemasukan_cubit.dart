import 'package:bloc/bloc.dart';
import 'package:cuanku/model/dataModel.dart';
import 'package:cuanku/services/dataServices.dart';
import 'package:equatable/equatable.dart';

part 'pemasukan_state.dart';

class PemasukanCubit extends Cubit<PemasukanState> {
  PemasukanCubit() : super(PemasukanInitial());
  void pemasukan()async{
     try {
      var a = await DataServices().pemasukan();
      emit(GetPemasukanSuccess(a));
    } catch (e) {
      print(e);
      emit(PemasukanGagal(e.toString()));
    }
  }
  void inputpemasukan({required String nominal,required String judul, required String keterangan,required String tanggal, required String kategori})async{
    try {
      List<DataModel>? b = await DataServices().insertdata(nominal:nominal,judul:judul,keterangan:keterangan,tanggal:tanggal,kategori:kategori);
      emit(PemasukanSuccess(b!));
    } catch (e) {
      print(e);
    }
  }
}
