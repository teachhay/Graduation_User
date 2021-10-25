// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:userapp/constants/config.dart';
import 'package:userapp/services/login.service.dart';
import 'package:userapp/widgets/appbar.dart';
import 'package:userapp/widgets/section_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

//FIXME widget overflow
class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool isLoading = false;

  handleLogin() async {
    dynamic response = await login(emailController.text, passwordController.text);

    if (response.meta == 200) {
      prefs.setString(tokenKey, response.token);
      token = response.token;
      Navigator.pushReplacementNamed(context, '/home');
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(response.message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SectionTitle(title: "Let's get started"),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  obscureText: !passwordVisible,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        !passwordVisible ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // for 2 children, change to spaceBetween
              children: [
                // TextButton(onPressed: () {}, child: const Text("Don't have an account?")),
                TextButton(onPressed: () {}, child: const Text("Forgot password?")),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : handleLogin,
                child: const Text("Login"),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: const <Widget>[
                Expanded(
                  child: Divider(
                    thickness: 2,
                    endIndent: 20,
                  ),
                ),
                Text("OR"),
                Expanded(
                  child: Divider(
                    thickness: 2,
                    indent: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                // ignore: todo
                //TODO register page
                onPressed: () {},
                child: const Text("Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
