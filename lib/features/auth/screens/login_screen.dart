import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:narra_apps/core/helpers/paths.dart';
import 'package:narra_apps/core/widgets/logo_card.dart';
import 'package:narra_apps/core/widgets/elevated_button_widget.dart';
import 'package:narra_apps/core/widgets/form_field.dart';
import 'package:narra_apps/features/auth/cubit/login_cubit.dart';
import 'package:narra_apps/features/auth/cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (ctx, state) {
                if (state.status == FormStatus.success) {
                  context.go(Paths.home);
                } else if (state.status == FormStatus.failure &&
                    state.errorMessage != null) {
                  ScaffoldMessenger.of(
                    ctx,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
                }
              },
              builder: (ctx, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LogoCard(),
                    const SizedBox(height: 32),

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
                    const SizedBox(height: 24),

                    if (state.status == FormStatus.loading)
                      const CircularProgressIndicator()
                    else
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
                          onPressed: () => context.go(Paths.register),
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
