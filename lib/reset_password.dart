import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
            hintText: 'New Password',
          ),
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 10),
        TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              hintText: 'Confirm password',
            ),
            textAlign: TextAlign.left,
            keyboardType: TextInputType.text)
      ],
    );
  }

  Widget buildSubmitBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 5,
            minimumSize: const Size.fromHeight(50)),
        child: const Text(
          'Submit',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('World of Schoolcraft')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reset Password',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            buildPassword(),
            SizedBox(height: 20),
            buildSubmitBtn()
          ],
        ),
      ),
    );
  }
}
