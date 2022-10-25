import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_learning/girl_page.dart';
import 'package:project_learning/register_page.dart';
import 'package:http/http.dart' as http;

Future login(String username, String password) async {
  final response = await http.post(
    Uri.parse('https://fakestoreapi.com/auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{username: username, password: password}),
  );
//mor_2314
//83r5^_
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to login.');
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  Future? res;

  @override
  void dispose() {
    super.dispose();
    usernameCtrl.dispose();
    passwordCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/EVN.webp"),
              TextFormField(
                controller: usernameCtrl,
                style: const TextStyle(color: Colors.orange),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: Icon(Icons.person),
                  hintText: "Tên đăng nhập",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập tên đăng nhập";
                  } else if (value.length < 6) {
                    return "Tên đăng nhập phải có ít nhất 6 kí tự";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordCtrl,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                style: const TextStyle(color: Colors.orange),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: Icon(Icons.key),
                  hintText: "Mật khẩu",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập mật khẩu";
                  } else if (value.length < 6) {
                    return "Mật khẩu phải có ít nhất 6 kí tự";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child:
                    (res == null) ? buidLogin(context) : buildFutureBuilder(),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: const Text(
                  "Đăng ký",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buidLogin(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          minimumSize: const Size.fromHeight(50),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          textStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final username = usernameCtrl.text;
          final password = passwordCtrl.text;
          setState(() {
            res = login(username, password);
          });
        }
      },
      child: const Text("Đăng nhập"),
    );
  }

  FutureBuilder buildFutureBuilder() {
    return FutureBuilder(
      future: res,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GirlPage()),
          );
        } else if (snapshot.hasError) {
          return Column(children: [
            Text(
              '${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 10),
            buidLogin(context),
          ]);
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
