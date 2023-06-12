
abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final String message;
  RegisterErrorState(this.message);

}
class RegisterSuccessState extends RegisterStates{}