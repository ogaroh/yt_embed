part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserDone extends UserState {
  UserDone({required this.users});

  final List<dynamic> users;
}
