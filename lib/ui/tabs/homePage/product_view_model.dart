import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/response/ProductDM.dart';
import '../../../domain/use Cases/GetAllProducts_UseCase.dart';
import '../../utilities/constants/product_state.dart';

@injectable
class ProductViewModel extends Cubit {

  GetAllProductsUseCase getAllProductsUseCase;

  ProductViewModel(this.getAllProductsUseCase)
      : super(InitialProductState());


  Future<void> LoadProducts() async {
    print('Loading products');
    var result = await getAllProductsUseCase.execute();
    result.fold(
            (failure) {
          print('Error loading products: ${failure.errorMessage}');
          emit(ProductErrorState(failure.errorMessage));
        },
            (products) {
          if (products.isNotEmpty) {
            emit(ProductSuccessState<List<ProductDM>>(data: products));
          } else {
            emit(ProductErrorState('No products found'));
          }
        }
    );
  }
}

