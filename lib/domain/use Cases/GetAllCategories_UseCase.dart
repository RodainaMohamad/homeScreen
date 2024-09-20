import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trial_hpg/data/homeRepo/homeRepo_impl.dart';
import 'package:trial_hpg/data/model/failure.dart';
import 'package:trial_hpg/data/model/response/CategoryDm.dart';
import 'package:trial_hpg/domain/repo/homeRepo.dart';
import 'package:trial_hpg/ui/utilities/constants/BaseStates.dart';

@injectable
class GetAllCategoriesUseCase extends Cubit {
  HomeRepo repo;
  GetAllCategoriesUseCase(this.repo) : super(BaseInitialState());

  void excute() async {
    print('Executing getCategories');
    try {
      Either<Failure, List<categoryDM>> either = await repo.getCategories();
      print('Either value: $either');
      either.fold(
            (failure) {
          print('getCategories failed: ${failure.errorMessage}');
          emit(BaseErrorState(failure.errorMessage));
        },
            (list) {
          print('getCategories succeeded: ${list.length} items');
          emit(BaseSuccessState<List<categoryDM>>(data: list));
        },
      );
    } catch (e) {
      print('Error: $e');
      emit(BaseErrorState('An unexpected error occurred'));
    }
  }
}