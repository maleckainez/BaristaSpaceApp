import 'dart:io';import 'package:dzienniczek_baristy/database/log_in_logic.dart';import 'package:dzienniczek_baristy/screens/reset_password_screen.dart';import 'package:flutter/material.dart';import 'package:flutter/services.dart';import 'register_screen.dart';import 'animations.dart';import 'bottom_navbar.dart';//import 'package:shared_preferences/shared_preferences.dart';class LoginScreen extends StatefulWidget {  @override  _LoginScreenState createState() => _LoginScreenState();}class _LoginScreenState extends State<LoginScreen>{  bool _obscurePassword = true;  DateTime? lastPressed;  final _formKey = GlobalKey<FormState>();  final emailController = TextEditingController();  final passwordController = TextEditingController();  String? passwordError;  @override  void dispose() {    emailController.dispose();    passwordController.dispose();    super.dispose();  }  @override  Widget build(BuildContext context){    return PopScope(      canPop: false,        onPopInvokedWithResult: (bool didPop, result) {          final now = DateTime.now();          const doubleclickTime = Duration(seconds: 2);          if (lastPressed == null || now.difference(lastPressed!) > doubleclickTime) {            lastPressed = now;            ScaffoldMessenger.of(context).showSnackBar(              SnackBar(                content: Text("You must press back twice to exit"),                duration: Duration(seconds: 1),              ),            );            return;          }          SystemNavigator.pop();        },    child: Scaffold(      resizeToAvoidBottomInset: true,      body: SafeArea(        child: AutofillGroup(          child: Padding(              padding: const EdgeInsets.all(20.0),              child: Form(                key: _formKey,                child: SingleChildScrollView(                child: Column(                mainAxisAlignment: MainAxisAlignment.center,                crossAxisAlignment: CrossAxisAlignment.start,                children: [                  Center(                  child: Image.asset('assets/logo.png',                    width: 130,                    height: 130),),                  SizedBox(height: 21),                  Align(                    alignment: Alignment.centerLeft,                    child: Text('Sign In',                      style: TextStyle(                      fontSize: 30,                      fontWeight: FontWeight.bold,                      color: Color(4282849952)                      ),                    ),                  ),                  SizedBox(height: 46),                  TextFormField(                    controller: emailController,                    autofillHints: [AutofillHints.email],                    decoration: InputDecoration(                      enabledBorder: OutlineInputBorder(                            borderRadius: BorderRadius.circular(12),                            borderSide: BorderSide(                              color: Color(4288104447),                              width: 2.0,),                      ),                      labelText: 'Email or User Name',                      labelStyle: TextStyle(                        color: Color(0xFFB3B3B3)                      ),                      prefixIcon: Icon(Icons.person_outline_rounded, color: Color(4282849952)),                      border: OutlineInputBorder(                        borderRadius: BorderRadius.circular(12),),),                  validator: (value){                      if (value == null || value.isEmpty){                        return "No email or User Name entered";                      }                      else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)){                        return "Invalid e-mail format";                      }                      return null;                  },                  ),                  SizedBox(height: 40),                  TextFormField(                    controller: passwordController,                    autofillHints: [AutofillHints.password],                    decoration: InputDecoration(                      enabledBorder: OutlineInputBorder(                        borderRadius: BorderRadius.circular(12),                        borderSide: BorderSide(                          color: Color(4288104447),                          width: 2.0,),                      ),                      labelText: 'Password',                      labelStyle: TextStyle(                        color: Color(0xFFB3B3B3),                      ),                      prefixIcon: Icon(Icons.lock_outline_rounded, color: Color(4282849952)),                      suffixIcon: IconButton(icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,                      color: Color(4283256141)),                        onPressed: () {                        setState(() {                          _obscurePassword = !_obscurePassword;                        });                        },                      ),                      border: OutlineInputBorder(                        borderRadius: BorderRadius.circular(12),                      ),                      errorText: passwordError                    ),                    obscureText: _obscurePassword,                    validator: (value){                      if (value == null || value.isEmpty){                        return "Please enter your password";}                      return null;                    },                  ),                  SizedBox(height: 40),                  Align(                    alignment: Alignment.centerRight,                  child: TextButton(onPressed: (){animatedNavigator(context, ResetPasswordScreen(), Offset(1, 0));                  },                      child: Text('Forget Password?',                      style: TextStyle(                        fontWeight: FontWeight.bold, fontSize: 15, color: Color(4282849952)                      ),),),),                  SizedBox(height: 40),                  ElevatedButton(                      onPressed: () async {                        print('Formularz jest poprawny');                        if (_formKey.currentState!.validate()){                          final isValid = await passwordValidator(passwordController.text, emailController.text);                          print("Przeszło funkcję Validator wynik to $isValid");                          if (isValid) {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => navbarMainScreen()));                          print("Wywołano navigator do mainpage");}                          {setState(() {                            passwordError = "Inwalid password or email";});                            print("Wywołano błąd z validatora");                          };                        } else {                          passwordError = "Inwalid password or email";                        }                        // DO DODANIA LOGOWANIE                      },                      style: ElevatedButton.styleFrom(                        backgroundColor: Color(4290479336),                        minimumSize: Size(double.infinity, 50),                        shape: RoundedRectangleBorder(                          borderRadius: BorderRadius.circular(12)                        )),                    child: Text('Sign In',                      style: TextStyle(fontSize: 15, color: Colors.white),                    ),                  ),                  SizedBox(height: 75),                  Center(                    child: Text('Or sign in With',                    style: TextStyle(                      fontSize: 15,                      fontWeight: FontWeight.normal,                      color: Color(4282849952)                    ),),),                  SizedBox(height: 24),                  Row(                    mainAxisAlignment: MainAxisAlignment.center,                    children: [                      GestureDetector(                        onTap: (){},                        child: Container(                          width: 50,                          height: 50,                          child: Padding(                            padding: EdgeInsets.all(10),                            child: Image.asset('assets/google_logo.png'),                          ),                          decoration: BoxDecoration(                            color: Colors.white,                            borderRadius: BorderRadius.circular(15),                            boxShadow:[                              BoxShadow(                                color: Colors.grey,                                offset: Offset(0, 3),                                blurRadius: 1,                              ),],),),),                      SizedBox(width: 24),                      GestureDetector(                        onTap: (){},                        child: Container(                          width: 50,                          height: 50,                          child: Padding(                            padding: EdgeInsets.all(10),                            child: Image.asset('assets/Facebook_Logo_Primary.png'),                          ),                          decoration: BoxDecoration(                            color: Colors.white,                            borderRadius: BorderRadius.circular(15),                            boxShadow:[                              BoxShadow(                                color: Colors.grey,                                offset: Offset(0, 3),                                blurRadius: 1,                              ),],),),),                      SizedBox(width: 24),                      GestureDetector(                        onTap: (){},                        child: Container(                          width: 50,                          height: 50,                          child: Padding(                            padding: EdgeInsets.all(10),                            child: Image.asset('assets/X_logo_black.png'),                          ),                          decoration: BoxDecoration(                            color: Colors.white,                            borderRadius: BorderRadius.circular(15),                            boxShadow:[                              BoxShadow(                                color: Colors.grey,                                offset: Offset(0, 3),                                blurRadius: 1,                              ),],),),),                      SizedBox(width: 24),                      GestureDetector(                        onTap: (){},                        child: Container(                          width: 50,                          height: 50,                          child: Padding(                            padding: EdgeInsets.all(4),                            child: Image.asset('assets/Li_logo.png'),                          ),                          decoration: BoxDecoration(                            color: Colors.white,                            borderRadius: BorderRadius.circular(15),                            boxShadow:[                              BoxShadow(                                color: Colors.grey,                                offset: Offset(0, 3),                                blurRadius: 1,                              ),],),),),                    ]                  ),                  SizedBox(height: 103),                  Center(                    child: TextButton(onPressed: (){                      animatedNavigator(context, RegisterScreen(), Offset(0.0, 1.0));                    },                        child: RichText(                          text: TextSpan(text: 'Don\'t have account ?',                            style: TextStyle(                              color: Color(4282849952),                              fontSize: 15.0,),                            children: [                              TextSpan(text: ' Sign Up',                              style: TextStyle(                                fontWeight: FontWeight.bold,)                              )                            ]                          ),                        ),                        ),                  )                ],                ),),              ),          )      )))    );}  }