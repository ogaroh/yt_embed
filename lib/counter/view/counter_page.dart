// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yt_test/counter/counter.dart';
import 'package:yt_test/counter/view/yt_embed.dart';
import 'package:yt_test/l10n/l10n.dart';
import 'package:yt_test/user/view/user_page.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(
        child: CounterBody(),
      ),
    );
  }
}

class CounterBody extends StatelessWidget {
  const CounterBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$count', style: theme.textTheme.displayLarge),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () => context.read<CounterCubit>().decrement(),
              icon: const Icon(Icons.remove),
              label: const Text('Decrement'),
            ),
            const SizedBox(width: 8),
            FilledButton.icon(
              onPressed: () => context.read<CounterCubit>().increment(),
              icon: const Icon(Icons.add),
              label: const Text('Increment'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const YTEmbedPage()),
          ),
          icon: const Icon(Icons.video_call),
          label: const Text('YouTube Embed'),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserPage()),
          ),
          icon: const Icon(Icons.person_2),
          label: const Text('Users'),
        ),
      ],
    );
  }
}
