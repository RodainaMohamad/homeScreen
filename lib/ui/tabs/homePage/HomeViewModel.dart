import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/response/categoryDm.dart';
import '../../../data/model/response/ProductDM.dart';
import '../../../domain/use Cases/GetAllCategories_UseCase.dart';
import '../../../domain/use Cases/GetAllProducts_UseCase.dart';
import '../../utilities/constants/BaseStates.dart';

@injectable
class HomeViewModel extends Cubit {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllProductsUseCase getAllProductsUseCase;

  HomeViewModel(this.getAllCategoriesUseCase, this.getAllProductsUseCase)
      : super(BaseInitialState());

  Future<void> LoadCategories() async {
    print('Loading categories');
    var result = await getAllCategoriesUseCase.execute(); // Fetching categories
    result.fold(
          (failure) {
        print('Error loading categories: ${failure.errorMessage}');
        emit(BaseErrorState(failure.errorMessage));
      },
          (categories) {
        if (categories.isNotEmpty) {
          print('Categories loaded successfully');
          emit(BaseSuccessState<List<categoryDM>>(data: categories)); // Emit success with categories data
        } else {
          print('No categories found');
          emit(BaseErrorState('No categories found')); // Emit error if no categories
        }
      },
    );
  }


}

