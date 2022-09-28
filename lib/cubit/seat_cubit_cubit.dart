import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class SeatCubitCubit extends Cubit<List<String>> {
  SeatCubitCubit() : super([]);

  void selectSeat(String idSeat) {
    print('prev state : ${state}');
    state.add(idSeat);
    print('new state : ${state}');
    emit(state);
  }
}
