import 'package:bloc/bloc.dart';
import 'package:login_state2/bloc/login_event.dart';
import 'package:login_state2/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  bool isPasswordVisible = false;

  
  LoginBloc():super(LoginInitila()){
  on<LoginButtunPressed>((event, emit) {
    emit(LoginLoadding());
    if(event.email == "rihana@gmail.com" && event.password == "12345678"){
      emit(LoginSucces());
    }else{
      emit(LoginError());
    }
  },);
  on<PasswordVisibility>((event, emit) {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginInitila(isVisible: isPasswordVisible));
  },);
  }
}