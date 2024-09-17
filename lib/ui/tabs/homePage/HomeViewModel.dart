import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trial_hpg/domain/use%20Cases/GetAllCategories_UseCase.dart';
import 'package:trial_hpg/domain/use%20Cases/GetAllProducts_UseCase.dart';
import 'package:trial_hpg/ui/utilities/constants/BaseStates.dart';

@injectable
class HomeViewModel extends Cubit {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllProductsUseCase getAllProductsUseCase;

  HomeViewModel(this.getAllCategoriesUseCase, this.getAllProductsUseCase)
      : super(BaseInitialState());

  void LoadCategories() {
    getAllCategoriesUseCase.excute();
  }

  void LoadProducts() {
    getAllProductsUseCase.excute();
  }
}