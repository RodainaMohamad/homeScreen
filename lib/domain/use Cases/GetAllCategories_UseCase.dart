import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trial_hpg/data/model/failure.dart';
import 'package:trial_hpg/data/model/response/CategoryDm.dart';
import 'package:trial_hpg/domain/repo/homeRepo.dart';
import 'package:trial_hpg/ui/utilities/constants/BaseStates.dart';

@injectable
class GetAllCategoriesUseCase extends Cubit{
  HomeRepo repo;
  GetAllCategoriesUseCase(this.repo):super(BaseInitialState());

  void excute()async{
    await repo.getCategories();
    Either<Failure,List<categoryDM>> either=await repo.getCategories();
    either.fold((failure)=>emit(BaseErrorState(failure.errorMessage)),
        (list)=>emit(BaseSuccessState<List<categoryDM>>(data: list)));
  }
}