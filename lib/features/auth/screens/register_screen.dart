import 'package:flutter/material.dart';
import 'package:narra_apps/features/auth/screens/login_screen.dart';
import 'package:narra_apps/core/widgets/elevated_button_widget.dart';

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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
             const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(),
                ),
              ),
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
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
