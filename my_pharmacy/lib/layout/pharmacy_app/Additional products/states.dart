abstract class AdditionStates {}

class AdditionStateInitial extends AdditionStates {}

class AdditionBottomNavState extends AdditionStates {}

class AdditionLoadingState extends AdditionStates {}

class AdditionSuccessState extends AdditionStates {}

class AdditionErrorState extends AdditionStates
{
  final String error;

  AdditionErrorState(this.error);
}
class AdditionSkinCareLoadingState extends AdditionStates {}

class AdditionSkinCareSuccessState extends AdditionStates {}

class AdditionSkinCareErrorState extends AdditionStates
{
  final String error;

  AdditionSkinCareErrorState(this.error);
}
class AdditionChildrenLoadingState extends AdditionStates {}

class AdditionChildrenSuccessState extends AdditionStates {}

class AdditionChildrenErrorState extends AdditionStates
{
  final String error;

  AdditionChildrenErrorState(this.error);
}
class AdditionDentalLoadingState extends AdditionStates {}

class AdditionDentalSuccessState extends AdditionStates {}

class AdditionDentalErrorState extends AdditionStates
{
  final String error;

  AdditionDentalErrorState(this.error);
}