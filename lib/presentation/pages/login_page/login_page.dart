import 'package:dk_mov/data/dummies/dummy_authentication.dart';
import 'package:dk_mov/data/dummies/dummy_user_repository.dart';
import 'package:dk_mov/data/firebase/firebase_authentication.dart';
import 'package:dk_mov/domain/usecases/login/login.dart';
import 'package:dk_mov/presentation/pages/main_page/main_page.dart';
import 'package:dk_mov/presentation/providers/router/router_provider.dart';
import 'package:dk_mov/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed('main');
          }
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(next.error.toString())));
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref
                .read(userDataProvider.notifier)
                .login(email: 'test@gmail.com', password: 'test123');
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
