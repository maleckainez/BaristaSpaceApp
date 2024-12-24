import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'animations.dart';
import '../logics/register_logic.dart';
import '../logics/hashing_logic.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscurePassword2 = true;
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  String? emailError;
  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    passwordConfirmController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, result){
        if (didPop){return;}
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
    child: Scaffold(
      body: Stack(children: [
        Positioned(
            top: -50,
            right: 20,
            child: CircleWidget(100, Color(0xFF471AA0))),
        Positioned(
            top: -40,
            right: -80,
            child: CircleWidget(142, Color(0xFFBB84E8))),
        AutofillGroup(
        child: SafeArea(
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
                        TextButton(onPressed: () {
                          animatedNavigator(context, LoginScreen(), Offset(0.0, -1.0));
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
                                Text(String.fromCharCode(
                                    Icons.arrow_back_ios.codePoint),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF471AA0),
                                      fontFamily: Icons.flash_on_outlined
                                          .fontFamily,
                                      package: Icons.flash_on_outlined
                                          .fontPackage),
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
                        ),
                        SizedBox(height: 46),
                        TextFormField(
                          controller: nameController,
                          autofillHints: [AutofillHints.givenName, AutofillHints.familyName],
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Color(4288104447),
                                width: 2.0,),
                            ),
                            labelText: 'Full Name',
                            labelStyle: TextStyle(
                                color: Color(0xFFB3B3B3)
                            ),
                            prefixIcon: Icon(Icons.person_outline_rounded,
                                color: Color(4282849952)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),),),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "No Name entered";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          controller: emailController,
                          autofillHints: [AutofillHints.email],
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Color(4288104447),
                                width: 2.0,),),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Color(0xFFB3B3B3)
                            ),
                            prefixIcon: Icon(Icons.mail_outline,
                                color: Color(4282849952)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),),
                            errorText: emailError,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "No email entered";
                            }
                            else if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value)) {
                              return "Invalid e-mail format";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          autofillHints: [AutofillHints.password],
                          controller: passwordController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Color(4288104447),
                                  width: 2.0),),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color(0xFFB3B3B3)
                            ),
                            prefixIcon: Icon(Icons.lock_outline_rounded,
                              color: Color(4282849952),),
                            suffixIcon: IconButton(icon: Icon(_obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                                color: Color(4283256141)),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            else if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            else if (!RegExp(
                                r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).+$')
                                .hasMatch(value)) {
                              return "Password must have at least one uppercase letter and symbol";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          autofillHints: [AutofillHints.password],
                          controller: passwordConfirmController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Color(4288104447),
                                  width: 2.0),),
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(color: Color(0xFFB3B3B3)),
                            prefixIcon: Icon(Icons.lock_outline_rounded,
                              color: Color(4282849952),),
                            suffixIcon: IconButton(icon: Icon(_obscurePassword2
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                                color: Color(0xFF4D4D4D)),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword2 = !_obscurePassword2;
                                });
                              },),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          obscureText: _obscurePassword2,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please confirm your password";
                            }
                            else if (value != passwordController.text) {
                              return "Password must match !";
                            }
                            return null;
                          },),
                        SizedBox(height: 80),
                        Center(
                          child: ElevatedButton(onPressed: () async {
                            if (_formKey.currentState!.validate()){
                              final result = await passwordHasher(passwordController.text);
                              final hash = result['hash']!;
                              final salt = result['salt']!;
                              final success = await registerNewUser(nameController.text, emailController.text , hash, salt);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(success ? "User registered successfully!" : "User registration failed"),),);
                              }
                            else {
                              print('Uzupełniono błędnie!');
                            }
                          },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(4290479336),
                              minimumSize: Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),),
                            ),
                            child: Text('Sign Up',
                              style: TextStyle(
                                fontSize: 15, color: Colors.white,
                              ),),),
                        ),
                        SizedBox(height: 140),
                        Center(
                          child: TextButton(onPressed: () {
                            animatedNavigator(context, LoginScreen(), Offset(0.0, -1.0));
                          },
                            child: RichText(
                              text: TextSpan(
                                text: 'Already have an account ?',
                                style: TextStyle(
                                  color: Color(4282849952), fontSize: 15.0,
                                ),
                                children: [TextSpan(
                                  text: ' Sign In',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,)
                                  ,),
                                ],)
                              ,),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            )
        )),
      ],),
    ));
  }
}
class CircleWidget extends StatelessWidget {
  final double size;
  final Color color;

  CircleWidget(this.size, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}