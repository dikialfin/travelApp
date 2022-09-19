import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class PageCubit extends Cubit<int> {
  // Super(0) => 0 (home_page) disini adalah index dari halaman yang akan di tuju
  PageCubit() : super(0);

  //  method untuk set index nya
  void setPage(int newPage) {
    emit(newPage);
  }

  // tambah kan pagecubit ke dalam file main
}
