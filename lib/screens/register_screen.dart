import 'package:flutter/cupertino.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen>{
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  String? passwordError;
  String? emailError;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: 39),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(50, 20),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(String.fromCharCode(Icons.arrow_back_ios.codePoint),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF471AA0),
                                  fontFamily: Icons.flash_on_outlined.fontFamily,
                                  package: Icons.flash_on_outlined.fontPackage),
                              ),
                              Text('Back',
                                  style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF471AA0),
                              ),),
                            ],
                          )),
                      SizedBox(height: 101),
                      Align(alignment: Alignment.centerLeft,
                        child: Text('Sign Up',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(4282849952)
                        )),
                      )
                    ],
                  ),
                )
            ),
          )
      ),
    );
  }

}