import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'animations.dart';
class ResetPasswordScreen extends StatefulWidget{
  @override
  _RPSState createState() => _RPSState();
}
class _RPSState extends State<ResetPasswordScreen>{
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  String? emailError;
@override
  Widget build(BuildContext context){
  return Scaffold(
    body: Stack(
      children: [
        Positioned(
            bottom: -50,
            left: -100,
            child: CircleWidget(200, Color(0xFF471AA0))),
        Positioned(
          bottom: -110,
          left: -10,
          child: CircleWidget(170, Color(0xFFBB84E8)),),
        Positioned(
          top: -170,
          right: -250,
          child: CircleWidget(400, Color(0xFFBB84E8)),),
        Positioned(
            top: -200,
            right: -100,
            child: CircleWidget(300, Color(0xFF471AA0))),
        SafeArea(
          child: AutofillGroup(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {
                        animatedNavigator(context, LoginScreen(), Offset(-1.0, 0.0));
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
                                  color: Color(0xFF471AA0),),),],)),
                      SizedBox(height: 120),
                      Align(alignment: Alignment.centerLeft,
                        child: Text('Forgot Your Password?',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(4282849952))),),
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
                      SizedBox(height: 40,),
                      Center(
                        child: ElevatedButton(onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            print('Formularz uzupełniony poprawnie: '+ emailController.text);
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
                          child: Text('Remind my password!',
                            style: TextStyle(
                              fontSize: 15, color: Colors.white,
                            ),),),
                      ),
                      SizedBox(height: 420,),
                      Center(
                        child: TextButton(onPressed: () {
                          animatedNavigator(context, LoginScreen(), Offset(-1.0, 0.0));
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
                      SizedBox(height: 40,)
                    ],
                  ),
                )),
          ),
        ),),
      ],
    ),
  );
}}
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