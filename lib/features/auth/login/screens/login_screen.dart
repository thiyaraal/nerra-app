import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:narra_apps/core/helpers/paths.dart';
import 'package:narra_apps/core/widgets/logo_card.dart';
import 'package:narra_apps/core/widgets/elevated_button_widget.dart';
import 'package:narra_apps/core/widgets/form_field.dart';
import 'package:narra_apps/features/auth/login/cubit/auth_cubit.dart';
import 'package:narra_apps/features/auth/login/cubit/login_cubit.dart';
import 'package:narra_apps/features/auth/login/cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LogoCard(),
              const SizedBox(height: 32),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (ctx, state) => Column(
                  children: [
                    CustomFormField(
                      labelText: 'Email',
                      initialValue: state.email,
                      onChanged: ctx.read<LoginCubit>().emailChanged,
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      labelText: 'Password',
                      obscureText: true,
                      initialValue: state.password,
                      onChanged: ctx.read<LoginCubit>().passwordChanged,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (ctx, state) {
            if (state.status == FormStatus.success) {
              ctx.read<AuthCubit>().login();
              ctx.go(Paths.home);
            } else if (state.status == FormStatus.failure && state.errorMessage != null) {
              ScaffoldMessenger.of(ctx).showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
            }
          },
          builder: (ctx, state) {
            if (state.status == FormStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomElevatedButton(
                    labelText: 'Login',
                    onPressed: ctx.read<LoginCubit>().submit,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Belum punya akun?'),
                      TextButton(
                        onPressed: () => ctx.go(Paths.register),
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
