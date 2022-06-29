import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cuanku/model/dataModel.dart';
import 'package:cuanku/services/dataServices.dart';

part 'pengeluaran_state.dart';

class PengeluaranCubit extends Cubit<PengeluaranState> {
  PengeluaranCubit() : super(PengeluaranInitial());
   void pengeluaran()async{
     try {
      var a = await DataServices().pengeluaran();
      emit(PengeluaranSuccess(a));
    } catch (e) {
      print(e);
      emit(PengeluaranGagal(e.toString()));
    }
  }
}

