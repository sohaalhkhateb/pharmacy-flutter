abstract class ProductStates {}

class ProductStateInitial extends ProductStates {}

class ProductBottomNavState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductSuccessState extends ProductStates {}

class ProductErrorState extends ProductStates
{
  final String error;

  ProductErrorState(this.error);
}
class ProductSearchLoadingState extends ProductStates {}

class ProductSearchSuccessState extends ProductStates {}

class ProductSearchErrorState extends ProductStates
{
  final String error;

  ProductSearchErrorState(this.error);
}


