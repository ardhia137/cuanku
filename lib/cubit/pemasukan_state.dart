part of 'pemasukan_cubit.dart';

abstract class PemasukanState extends Equatable {
  const PemasukanState();

  @override
  List<Object> get props => [];
}

class PemasukanInitial extends PemasukanState {}
class PemasukanSuccess extends PemasukanState{
  final List <DataModel> data;
  PemasukanSuccess(this.data);
  @override
  List<Object> get props => [data];
}
class GetPemasukanSuccess extends PemasukanState{
  var data = 0;
  GetPemasukanSuccess(this.data);
  @override
  List<Object> get props => [data];
}
class PemasukanGagal extends PemasukanState{
  final String error;
  const PemasukanGagal(this.error);
  @override
  List<Object> get props => [error];
}
