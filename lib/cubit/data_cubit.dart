import 'package:bloc/bloc.dart';
import 'package:cuanku/model/dataModel.dart';
import 'package:cuanku/services/dataServices.dart';
import 'package:equatable/equatable.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  void getData() async{
    try {
      List<DataModel> data = await DataServices().getdatalist();
      emit(DataSuccess(data));
    } catch (e) {
      print(e);
      emit(DataGagal(e.toString()));
    }
  }
  void pengeluaran()async{
     try {
      var a = await DataServices().pengeluaran();
      emit(PengeluaranSuccess(a));
    } catch (e) {
      print(e);
      emit(DataGagal(e.toString()));
    }
  }
   void hapusdata({required String nominal,required String id,required String kategori})async{
    try {
      List<DataModel>? b = await DataServices().hapus(nominal:nominal,id:id, kategori:kategori);
      emit(DataSuccess(b!));
    } catch (e) {
      print(e);
    }
  }
}
