part of 'auth_cubit.dart';

// Equatable ini berguna untuk mempermudah kita ketika melakukan perbandingan antar object

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// AuthInitial : inisialisasi dari auth cubit
class AuthInitial extends AuthState {}

//  untuk state ketika loading
class AuthLoading extends AuthState {}

// untuk state ktika sukses melakukan auth
class AuthSuccess extends AuthState {
  // ketika auth success di sini kita akan mendapatkan data dari use. maka dari itu di perlukan properti pada class ini untuk menampung data nya

  final UserModel user;
  AuthSuccess(this.user);

  // get props ini adalah getter untuk mengambil semua props yang ada pada class ini
  @override
  List<Object> get props => [user];
}

// untuk state ketika gagal authentication
class AuthFailed extends AuthState {
  //  di sini kita akan menampilkan pesan error

  final String error;
  AuthFailed(this.error);

  // get props ini adalah getter untuk mengambil semua props yang ada pada class ini
  @override
  List<Object> get props => [error];
}
