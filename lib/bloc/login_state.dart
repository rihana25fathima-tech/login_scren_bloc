abstract class LoginState {}
class LoginInitila extends LoginState{
  final bool isVisible;
  LoginInitila({this.isVisible =false});
}
class LoginLoadding extends LoginState{}
class LoginSucces extends LoginState{}
class LoginError extends LoginState{}