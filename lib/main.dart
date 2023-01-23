import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/info_screen.dart';
import 'package:flutter_complete_guide/user_data_handler.dart';
import 'package:path/path.dart' ;
import 'lgoin_handler.dart';

String username = '';
String password = '';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: FirstScreen(),
  ));
}
class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder()
                    ),
                    onChanged: (String value) {
                      username = value.toString();
                    },
                    validator: (value) {
                      return value.isEmpty ? 'Please enter email' : null;
                    },
                  ),

                  SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder()
                    ),
                    onChanged: (String value) {
                      password = value.toString();
                    },
                    validator: (value) {
                      return value.isEmpty ? 'Please enter password' : null;
                    },
                  ),
                  SizedBox(height: 30,),
                  MaterialButton(
                    minWidth: double.minPositive,
                    onPressed: () async {
                      var response = await loginValidation(username, password);
                      if (response != false) {
                        List<Widget> userData = userInfoList(response);
                        print(userData);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                UserInfoScreen(userData)));
                      }
                      else {
                        //show email or password are wrong
                      }
                    },
                    child: Text('Login'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('LoginTest'),
//       ),
//       body: Center(
//         child: Text('Let\'s build a shop!'),
//       ),
//     );
//   }
// }
