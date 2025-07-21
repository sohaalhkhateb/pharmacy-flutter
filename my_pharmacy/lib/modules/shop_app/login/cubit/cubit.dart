import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/models/shop_app/login_models.dart';
import 'package:my_pharmacy/modules/shop_app/login/cubit/states.dart';

import '../../../../shared/network/remote/dio_helper_shop.dart';
import '../../../../shared/network/remote/end_points.dart';


class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModel loginModel = ShopLoginModel();

void userLogin({
 required String? email,
  required String? password,
})
{
  emit(ShopLoginLoadingState());

DioHelperShop.postData(
      url: LOGIN,
      data: 
      {
        'email':email,
        'password':password,
      },
       query: {},).then((value)
    {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error){
  emit(ShopLoginErrorState(error.toString()));
});
}
}