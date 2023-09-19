import 'package:cp3405_project/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isRememberMe = false;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              hintText: 'Email'),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          obscureText: true,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              hintText: 'Enter password'),
          textAlign: TextAlign.left,
          controller: passwordController,
          keyboardType: TextInputType.text, // Not sure if name is correct
        ),
      ],
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () => print('Login button pressed'),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 5,
            minimumSize: const Size.fromHeight(50)),
        child: const Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account?'),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const SignUpPage()));
          },
          child: const Text(
            'Sign up',
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget buildAccountManagement() {
    return Row(
      children: [
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.blue),
          child: Checkbox(
            value: isRememberMe,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: (value) {
              setState(() {
                isRememberMe = value!;
              });
            },
          ),
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () => print('Forgot button pressed'),
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('World of Schoolcraft')),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              buildEmail(),
              const SizedBox(height: 20),
              buildPassword(),
              buildAccountManagement(),
              buildLoginBtn(),
              buildSignUp()
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
