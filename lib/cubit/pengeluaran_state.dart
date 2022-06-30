part of 'pengeluaran_cubit.dart';

abstract class PengeluaranState extends Equatable {
  const PengeluaranState();

  @override
  List<Object> get props => [];
}

class PengeluaranInitial extends PengeluaranState {}

class PengeluaranSuccess extends PengeluaranState{
  var data = 0;
  
  PengeluaranSuccess(this.data);
  @override
  List<Object> get props => [data];
}
class PengeluaranGagal extends PengeluaranState{
  final String error;
  const PengeluaranGagal(this.error);
  @override
  List<Object> get props => [error];
}

