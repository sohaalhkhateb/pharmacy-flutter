import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/layout/pharmacy_app/Additional%20products/states.dart';
import 'package:my_pharmacy/layout/pharmacy_app/dio_helper_pharmacy/dio_helper_pharmacy.dart';

class AdditionCubit extends Cubit<AdditionStates>
{
AdditionCubit() : super(AdditionStateInitial());

static AdditionCubit get(context) => BlocProvider.of(context);

List<dynamic> adittiondental = [];

void getDental()
{
emit(AdditionDentalLoadingState());
DioHelperPharmacy.getData(
  url: '/display_dental_prods', 
  query: {},
        ).then((value)
    {
      adittiondental = value.data;
      emit(AdditionDentalSuccessState());
      print("عدد الأدوية: ${adittiondental.length}");
    }).catchError((error)
    {
      print("Request Error: $error");
      emit(AdditionDentalErrorState(error.toString()));
    });
}

List<dynamic> adittionchildren = [];

void getChildren()
{
emit(AdditionChildrenLoadingState());
DioHelperPharmacy.getData(
  url: '/display_child_prods', 
  query: {},
        ).then((value)
    {
      adittionchildren = value.data;
      emit(AdditionChildrenSuccessState());
      print("عدد الأدوية: ${adittionchildren.length}");
    }).catchError((error)
    {
      print("Request Error: $error");
      emit(AdditionChildrenErrorState(error.toString()));
    });
}

List<dynamic> adittionskincare = [];

void getSkinCare()
{
emit(AdditionSkinCareLoadingState());
DioHelperPharmacy.getData(
  url: '/display_skin_prods', 
  query: {},
        ).then((value)
    {
      adittionskincare = value.data;
      emit(AdditionSkinCareSuccessState());
      print("عدد الأدوية: ${adittionskincare.length}");
    }).catchError((error)
    {
      print("Request Error: $error");
      emit(AdditionSkinCareErrorState(error.toString()));
    });
}
}