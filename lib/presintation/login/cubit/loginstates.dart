
abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}
class LoginErrorState extends LoginStates{
  final String message;
  LoginErrorState(this.message);

}
class LoginSuccessState extends LoginStates{}