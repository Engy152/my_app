
abstract class LoginStates { }

class AppInitialStates extends LoginStates { }
class LoginLodingStates extends LoginStates { }
class LoginSuccessStates extends LoginStates
{
  // final UserModel loginModel;
  LoginSuccessStates(
      //this.loginModel
      );
}
class LoginErrorStates extends LoginStates
{
 // final String error;

 // LoginErrorStates(this.error);

}
