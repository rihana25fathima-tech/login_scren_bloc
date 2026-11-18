import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_state2/bloc/login_bloc.dart';
import 'package:login_state2/bloc/login_event.dart';
import 'package:login_state2/bloc/login_state.dart';
import 'package:login_state2/screen/hom_screen.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: BlocConsumer<LoginBloc,LoginState>( listener: (context, state) {
        if(state is LoginSucces){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("LoginSuccefully")));
          Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));
        }
        if(state is LoginError){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid ")));
        }
      
      },builder: (context, state) {
        if(state is LoginLoadding){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is LoginInitila){
          isVisible = state.isVisible;
        }
      return 
      
      Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "enter email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),
           TextField(
            controller: passwordController,
            obscureText: !isVisible,
            decoration: InputDecoration(
              hintText: "enter password",
              border: OutlineInputBorder(),
              suffixIcon: IconButton(onPressed: () {
                context.read<LoginBloc>().add(PasswordVisibility());
              }, icon: Icon(isVisible ? Icons.visibility :Icons.visibility_off))
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
        context.read<LoginBloc>().add(LoginButtunPressed(emailController.text, passwordController.text));
          }, child: Text("Login"))
        ],
      );
      
      }
      ),
    );
  }
}