// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:yt_test/user/repo/users_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial()) {
    getUsers();
  }

  final UserRepo userRepo = UserRepo();

  // get users
  Future<void> getUsers() async {
    final users = await userRepo.getUsers();
    emit(UserDone(users: users));
  }
}
