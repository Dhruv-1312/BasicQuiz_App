import 'package:adv_basics/auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "signup",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'name'
          ),
        ),
        TextField(
          controller: controller1,
          decoration: InputDecoration(
            hintText: 'Email'
          ),
        ),
        TextField(
          controller: controller2,
          decoration: InputDecoration(
            hintText: 'password'
          ),
        ),
        ElevatedButton(
          onPressed: () async{
            String a=await Auth().createUser(name: controller.text, Email_id: controller1.text, password: controller2.text);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(a),));

          },
          child: Text('signup'),
        )
      ],
    );
  }
}
