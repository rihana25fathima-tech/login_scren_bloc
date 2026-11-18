abstract class LoginEvent {}
class LoginButtunPressed extends LoginEvent{
  String email;
  String password;
  LoginButtunPressed(this.email,this.password);
}
class PasswordVisibility extends LoginEvent{}