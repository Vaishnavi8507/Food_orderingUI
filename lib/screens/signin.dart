import 'package:flutter/material.dart';
import 'package:newlogin/reusable/reusewidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newlogin/screens/homeScreen.dart';
import 'package:newlogin/screens/resetPassword.dart';
import 'package:newlogin/screens/signup.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       width:MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       decoration: BoxDecoration(
         gradient: LinearGradient(colors: [
           Colors.purpleAccent,
           Colors.lightBlueAccent,
          // Colors.pinkAccent,
         ],
             begin: Alignment.topCenter,end: Alignment.bottomCenter
         ),
       ),
       child: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(20),
          //   20,MediaQuery.of(context).size.height* 0.2,20,0),
           child: Column(
             children: <Widget>[
               logoWidget("assets/images/login.png"),
               const SizedBox(height: 30.0),
               resuableTextField("Enter Email", Icons.person_outline, false, _emailTextController),
               const SizedBox(height: 20),
               resuableTextField("Enter Password ", Icons.lock_open_sharp, true, _passwordTextController),
               const SizedBox(height: 5),
              forgetPassword(context),
               firebaseUIButton(context, "Sign In",() {
                 FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value){
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                 }).onError((error,stackTrace){
                   print("Error${error.toString()}");
                 });
               }),
               signUpOption()
             ],
           ),
         ),
       )
     ),
    );
  }
  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have a account?",
        style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 16,
          color: Colors.white,
        ),),
        GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
            },
          child: const Text("Sign Up",
          style: TextStyle(
            color: Colors.white,fontSize:16,fontWeight: FontWeight.bold ,
          ),),
        ),
      ],
    );
  }
  Widget forgetPassword(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: Text("Forgot Password?",
        style: TextStyle(color: Colors.white70),
        textAlign: TextAlign.right,
        ),
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword())),
      ),
    );
  }
}
