import 'package:flutter/cupertino.dart';
import 'package:health/export.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _hidePassword = true;
  void _passwordToggle() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  void _signIn() {
    bool valid = _globalKey.currentState!.validate();
    if (valid) {
      // navigate home
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingScreen()));
    } else {
      // call error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(height: 40.0),
            SizedBox(
              width: 200,
              height: 160,
              child: Column(
                children: [
                  Icon(Icons.medication, size: 50, color: Color(0xFF6F8BEF)),
                  Text(
                    "Adhicine",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6F8BEF)),
                  )
                ],
              ),
            ),
            Text("Sign In",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.0),
            TextFormField(
                controller: _emailController,
                validator: validateEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    hintText: "Enter Your Email",
                    prefixIcon: Icon(Icons.alternate_email_rounded,
                        color: Colors.teal))),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              validator: validatePassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: _hidePassword ? true : false,
              decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  prefixIcon:
                      Icon(Icons.lock_outline_rounded, color: Colors.teal),
                  suffixIcon: IconButton(
                      onPressed: () => _passwordToggle(),
                      icon: Icon(_hidePassword
                          ? Icons.visibility_off_rounded
                          : Icons.visibility))),
            ),
            Align(
              alignment: Alignment.centerRight,
              child:
                  TextButton(onPressed: () {}, child: Text("Forgot Password?")),
            ),
            SizedBox(height: 20.0),
            CupertinoButton(
                color: AppColor.primary,
                onPressed: () => _signIn(),
                borderRadius: BorderRadius.circular(20),
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Divider())
              ],
            ),
            SizedBox(height: 20.0),
            OutlinedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 35,
                          width: 35,
                          child: Image.asset("assets/google.png")),
                      Text(
                        "Continue with Google",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New To Adhicine?"),
                TextButton(onPressed: () {}, child: Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

String? validateEmail(String? value) {
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (value == null || value.trim().isEmpty) {
    return "Email is Required";
  }
  if (!emailRegex.hasMatch(value)) {
    return "incorrect Email Address";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "password is Required";
  }
  if (value.length < 8) {
    return "Password don't match";
  }

  return null;
}
