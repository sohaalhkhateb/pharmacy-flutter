import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/layout/pharmacy_app/cubit/states.dart';
import 'package:my_pharmacy/layout/pharmacy_app/dio_helper_pharmacy/dio_helper_pharmacy.dart';
import 'package:my_pharmacy/layout/pharmacy_app/product_details/cubit/states.dart';

class ProductDetailsCubit extends Cubit<ProductStates>
{
  ProductDetailsCubit() : super(ProductStateInitial());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  List<dynamic> products = [];

  void getProducts()
  {
    emit(ProductLoadingState());

    DioHelperPharmacy.getData(
        url: '/display_meds',
        query: {},
        ).then((value)
    {
      products = value.data;
      emit(ProductSuccessState());
      print("عدد الأدوية: ${products.length}");
    }).catchError((error)
    {
      print("Request Error: $error");
      emit(ProductErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

void getSearch(String query) {
  emit(ProductSearchLoadingState());

  DioHelperPharmacy.getData(
    url: '/search_meds', 
    query: {
      'query': query,
    }).then((value) 
    {
      print('Raw search data: ${value.data}');
      search = value.data;
      emit(ProductSearchSuccessState());
    print("Search results: ${search.length}");
   }).catchError((error) {
    print("Search error: $error");
    emit(ProductSearchErrorState(error.toString()));
  });
    }
}