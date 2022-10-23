import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xencov/services/auth_service.dart';
import 'package:xencov/widgets/button_widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  String? errorMessage = '';
  bool isFormValidated = false;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validate(){
    if(formKey.currentState!.validate()){
      setState(() {
        isFormValidated = true;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget appButton(String label, bool isPrimary,[Function()? onTap, IconData? icon]){
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width / 2.28,
      decoration: BoxDecoration(
        color: isPrimary 
        ? Colors.orange
        : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Visibility(
              visible: (icon == null) ? false : true,   
              replacement: const SizedBox(),
              child: Expanded(
                child: CircleAvatar(
                  backgroundColor:const Color.fromARGB(150, 241, 237, 237),
                  child: Icon(icon, color: Colors.white)
                )
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: (icon == null) ? 1 : 2,
              child: Wrap(
                children: [
                  Text(label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  Widget btnText(String label){
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/consult.png'),
              const Text("Xencov \nWelcomes You !!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: MediaQuery.of(context).size.height / 3.2,
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  onChanged: validate,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: "Email*"
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'email is required';
                          }
                          else if(value.length<3)
                          {
                            return 'email must have atleast 3 ';
                          }
                          else if(!value.contains(RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')))
                          {
                            return 'email should be look like : example@domain.com';
                          }
                            return null;                        
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password*"
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Password is required';
                          }
                          else if(value.length<8)
                          {
                            return 'Password must have atleast 8 ';
                          }
                          else if(value.length>16)
                          {
                            return 'Password must have atmost 16 ';
                          }
                          else if(!value.contains(RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')))
                          {
                            return 'Password must contain: atleast one alphabet, \n atleast one number and atleast one special character';
                          }
                          return null;
                        },
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Forgot Password ?", textAlign: TextAlign.left)
                      ),
                    ],
                  )
                ),
              ),
              const Spacer(),
              (isLoading == true)
              ? const Center(child: CircularProgressIndicator())
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: appButtonStyle(true, context),
                      onPressed: (isFormValidated == true)
                      ? (){
                          setState(() {
                            isLoading = true;
                          });
                          createUserWithEmailAndPassword();} 
                      : (){},
                      child: btnText("Sign Up")
                    ),
                    ElevatedButton(
                      style: appButtonStyle(false, context),
                      onPressed: (isFormValidated == true)
                      ? (){
                          setState(() {
                            isLoading = true;
                          });
                          signInWithEmailAndPassword();} 
                      : (){},
                      child: btnText("Sign In")
                    ),
                  ],
                ),
              /* Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appButton("Sign Up", true, createUserWithEmailAndPassword),
                  appButton("Sign In", false, signInWithEmailAndPassword)
                ],
              ) */
            ],
          ),
        ),
      ),
    );
  }
}