import 'package:airplane/Services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:airplane/Models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    try {
      //  mengubah state ke dalam loading
      //  ini akan mengakibatkan button menjadi animasi loading
      emit(AuthLoading());

      UserModel user = await AuthService()
          .SignUp(email: email, password: password, name: name, hobby: hobby);

      //  ketika sukses ubah state nya menjadi auth success
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
