import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen>{
  final _form = GlobalKey<FormState>();
  final emailTextField = TextEditingController();
  final passwordTextField = TextEditingController();
  var _islogin = false;
  var _enteredemail = '';
  var _enteredpassword = '';


  void _submit() async {
    _form.currentState!.validate();
    _form.currentState!.save();


    try{
      if(_islogin){
        final userCredentials = await _firebase.signInWithEmailAndPassword(
          email: _enteredemail, password: _enteredpassword);
      }else{
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredemail, password: _enteredpassword);
      }
    }on FirebaseAuthException catch (error){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? " Auth Failed"))
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 245, 164, 208),
              height: 300,
              width: 500,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(height: 16,),
            Card(
              margin: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailTextField,
                        decoration: InputDecoration(
                          labelText: !_islogin? 
                          "Registered Mail" : "Email address Field",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if(value==null 
                          || value.trim().isEmpty 
                          || !value.contains("@")){
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _enteredemail = newValue!;
                          print(_enteredemail);
                        },
                      ),
                      TextFormField(
                        controller: passwordTextField,
                        decoration: InputDecoration(
                          labelText: !_islogin? 
                          "Registered Password" : "Password Field",
                        ),
                        obscureText: true,
                        validator: (value) {
                          if(value==null 
                          || value.trim().isEmpty 
                          || value.length<6){
                            return "Please enter a valid password ";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _enteredpassword=newValue!;
                          print(_enteredpassword);
                        },
                      ),
                      const SizedBox(height: 16,),
                      ElevatedButton(
                      onPressed: _submit,
                       child: _islogin? Text("LogIn") : Text("Save")
                       ),
                      TextButton(
                      onPressed: (){
                      setState(() {
                        _islogin=!_islogin;
                        emailTextField.clear();
                        passwordTextField.clear();
                      });
                      },
                       child: !_islogin? 
                       Text("Account Already exits!"):Text("Create Account")
                       ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}