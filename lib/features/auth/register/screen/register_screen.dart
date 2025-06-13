import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:narra_apps/features/auth/login/screens/login_screen.dart';
import 'package:narra_apps/core/widgets/elevated_button_widget.dart';
import 'package:narra_apps/features/auth/register/cubit/register_cubit.dart';
import 'package:narra_apps/features/auth/register/cubit/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'NARRA',
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF7A86B6),
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 1,
                    width: 40,
                    color: Color(0xFF7A86B6),
                    margin: const EdgeInsets.only(left: 140),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state.status == FormStatus.success) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                } else if (state.status == FormStatus.failure &&
                    state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage!)),
                  );
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: context.read<RegisterCubit>().usernameChanged,
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: context.read<RegisterCubit>().emailChanged,
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        onChanged:
                            context.read<RegisterCubit>().passwordChanged,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text('Sudah punya akun ?'),
                TextButton(child: Text('Login'), onPressed: () {
                  Navigator.pop(context);
                }),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
        child: CustomElevatedButton(
          labelText: 'Register',
          onPressed: () {
            context.read<RegisterCubit>().submit();
          },
        ),
      ),
    );
  }
}
