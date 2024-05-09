import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yt_test/l10n/l10n.dart';
import 'package:yt_test/modules/user/cubit/user_cubit.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(),
      child: const UsersView(),
    );
  }
}

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: CupertinoActivityIndicator(),
              ),
            );
          } else if (state is UserDone) {
            if (state.users.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('No users available'),
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async => context.read<UserCubit>().getUsers(),
                child: ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final user = state.users[index] as Map;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.person_2),
                        title: Text(
                          user['name'].toString(),
                        ),
                        subtitle: Text(
                          user['email'].toString(),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text('An unknown error ocurred'),
              ),
            );
          }
        },
      ),
    );
  }
}
