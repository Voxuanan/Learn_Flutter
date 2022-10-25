import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_learning/girl_page.dart';
import 'package:project_learning/login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _formKeyUserName = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKeyUserName,
        child: Column(
          children: [
            Image.asset("assets/images/EVN.webp"),
            TextFormField(
              style: const TextStyle(color: Colors.orange),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                prefixIcon: Icon(Icons.person),
                hintText: "Họ và tên",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập họ và tên";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly
              ],
              style: const TextStyle(color: Colors.orange),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                prefixIcon: Icon(Icons.person),
                hintText: "Tuổi",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập tuổi";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size.fromHeight(50),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              onPressed: () {
                if (_formKeyUserName.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GirlPage()),
                  );
                }
              },
              child: const Text("Đăng ký"),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                "Đăng nhập",
                style: TextStyle(fontSize: 15, color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
