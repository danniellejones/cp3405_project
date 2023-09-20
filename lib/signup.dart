import 'package:cp3405_project/login.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  bool validate = false;

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              hintText: 'First name',
              errorText: validate ? 'Please enter first name' : null),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
          controller: firstNameController,
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              hintText: 'Last name',
              errorText: validate ? 'Please enter last name' : null),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
          controller: lastNameController,
        )
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
              hintText: 'Email',
              errorText: validate ? 'Please enter email' : null),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
          controller: emailController,
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              hintText: 'Enter password',
              errorText: validate ? 'Please enter password' : null),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
          controller: passwordController,
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              hintText: 'Confirm password',
              errorText: validate ? 'Please enter password' : null),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
          controller: confirmPasswordController,
        )
      ],
    );
  }

  Widget buildSignUpBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            firstNameController.text.isEmpty
                ? validate = true
                : validate = false;
            lastNameController.text.isEmpty
                ? validate = true
                : validate = false;
            emailController.text.isEmpty ? validate = true : validate = false;
            passwordController.text.isEmpty
                ? validate = true
                : validate = false;
            confirmPasswordController.text.isEmpty
                ? validate = true
                : validate = false;
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 5,
            minimumSize: const Size.fromHeight(50)),
        child: const Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildLogIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?'),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => LoginPage()));
          },
          child: const Text(
            'Log in',
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World of Schoolcraft'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                buildName(),
                const SizedBox(height: 10),
                buildEmail(),
                const SizedBox(height: 10),
                buildPassword(),
                const SizedBox(height: 20),
                buildSignUpBtn(),
                buildLogIn()
              ])),
    );
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
