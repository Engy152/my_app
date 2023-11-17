
abstract class LoginStates { }

class AppInitialStates extends LoginStates { }
class LoginLodingStates extends LoginStates { }
class LoginSuccessStates extends LoginStates
{

  // final String tokenType;
  // LoginSuccessStates(this.tokenType);

}
class LoginErrorStates extends LoginStates
{
 // final String error;

 // LoginErrorStates(this.error);

}

class LoginChangPasswordInitialStates extends LoginStates { }
