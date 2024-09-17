import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial_hpg/data/model/failure.dart';
import 'package:trial_hpg/data/model/response/ProductDM.dart';
import 'package:trial_hpg/domain/repo/homeRepo.dart';
import 'package:trial_hpg/ui/utilities/constants/BaseStates.dart';

class GetAllProductsUseCase extends Cubit{
  HomeRepo repo;
  GetAllProductsUseCase(this.repo):super(BaseInitialState());

  void excute()async{
    await repo.getProducts();
    Either<Failure,List<ProductDM>> either=await repo.getProducts();
    either.fold((failure)=>emit(BaseErrorState(failure.errorMessage)),
            (list)=>emit(BaseSuccessState<List<ProductDM>>(data: list)));
  }
}