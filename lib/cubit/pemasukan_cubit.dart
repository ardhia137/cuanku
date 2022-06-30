import 'package:bloc/bloc.dart';
import 'package:cuanku/services/dataServices.dart';
import 'package:equatable/equatable.dart';

part 'pemasukan_state.dart';

class PemasukanCubit extends Cubit<PemasukanState> {
  PemasukanCubit() : super(PemasukanInitial());
  void pemasukan()async{
     try {
      var a = await DataServices().pemasukan();
      emit(PemasukanSuccess(a));
    } catch (e) {
      print(e);
      emit(PemasukanGagal(e.toString()));
    }
  }
}
