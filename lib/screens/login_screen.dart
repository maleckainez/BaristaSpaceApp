import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                  child: Image.asset('assets/logo.png',
                    width: 130,
                    height: 130),),
                  SizedBox(height: 21),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Sign in',
                      style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(4282849952)
                      ),
                    ),
                  ),
                  SizedBox(height:46),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(4288104447),
                              width: 2.0,),
                      ),
                      labelText: 'Email or User Name',
                      prefixIcon: Icon(Icons.person_outline_rounded, color: Color(4282849952)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),),),
                  validator: (value){
                      if (value == null || value.isEmpty){
                        return "No email or User Name entered";
                      }
                      else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)){
                        return "Invalid e-mail format";
                      }
                      return null;
                  },
                  ),
                  SizedBox(height: 40),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(4288104447),
                          width: 2.0,),
                      ),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline_rounded, color: Color(4282849952)),
                      suffixIcon: IconButton(icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Color(4283256141)),
                        onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){},
                      child: Text('Forget Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15, color: Color(4282849952)
                      ),),),),
                  SizedBox(height: 40),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()){
                          print('Form is valid');
                        } else {
                          print('Form is not valid');
                        }
                        // DO DODANIA LOGOWANIE
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(4290479336),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        )),
                    child: Text('Sign In',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 75),
                  Center(
                    child: Text('Or sign in With',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Color(4282849952)
                    ),),),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset('assets/google_logo.png'),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow:[
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 3),
                                blurRadius: 1,
                              ),],),),),
                      SizedBox(width: 24),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset('assets/Facebook_Logo_Primary.png'),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow:[
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 3),
                                blurRadius: 1,
                              ),],),),),
                      SizedBox(width: 24),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset('assets/X_logo_black.png'),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow:[
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 3),
                                blurRadius: 1,
                              ),],),),),
                      SizedBox(width: 24),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Image.asset('assets/Li_logo.png'),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow:[
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 3),
                                blurRadius: 1,
                              ),],),),),
                    ]
                  ),
                  SizedBox(height: 90),
                  Center(
                    child: TextButton(onPressed: (){},
                        child: RichText(
                          text: TextSpan(text: 'Don\'t have account ?',
                            style: TextStyle(
                              color: Color(4282849952),
                              fontSize: 15.0,),
                            children: [
                              TextSpan(text: ' Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,)
                              )
                            ]
                          ),
                        ),

                        ),
                  )
                ],
                ),
              ),
          ),
      ));
  }
}