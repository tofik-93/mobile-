import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
      ),
    );
  }
}

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogin = true;
  String? errorMessage;

  Future<void> authenticate(String email, String password) async {
    try {
      if (isLogin) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
      } else {
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
      }
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void toggleAuthMode() {
    isLogin = !isLogin;
    notifyListeners();
  }
}

class AuthScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(authProvider.isLogin ? "Login" : "Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            if (authProvider.errorMessage != null)
              Text(authProvider.errorMessage!, style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authProvider.authenticate(emailController.text.trim(), passwordController.text.trim());
              },
              child: Text(authProvider.isLogin ? "Login" : "Register"),
            ),
            TextButton(
              onPressed: authProvider.toggleAuthMode,
              child: Text(authProvider.isLogin ? "Create an account" : "Already have an account?"),
            )
          ],
        ),
      ),
    );
  }
}
