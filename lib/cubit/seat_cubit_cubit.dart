import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class SeatCubitCubit extends Cubit<List<String>> {
  SeatCubitCubit() : super([]);

  void selectSeat(String idSeat) {
    if (!isSelected(idSeat)) {
      state.add(idSeat);
    } else {
      state.remove(idSeat);
    }
    emit(List.from(state));
  }

  // method untuk mengecek apakan id nya sudah ada di dalam list atau belum
  // jika data tidak terdapat pada list indexOf() akan mengembalikan nilai -1
  bool isSelected(String idSeat) {
    int index = state.indexOf(idSeat);
    print('Index : $index');
    return (index == -1) ? false : true;
  }
}
