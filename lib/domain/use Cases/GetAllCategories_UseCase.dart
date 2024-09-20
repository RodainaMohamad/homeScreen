import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/failure.dart';
import '../../data/model/response/categoryDm.dart';
import '../repo/homeRepo.dart';

@injectable
class GetAllCategoriesUseCase {
  HomeRepo repo;

  GetAllCategoriesUseCase(this.repo);

  Future<Either<Failure, List<categoryDM>>> execute() async {
    print('Executing getCategories');
    return await repo.getCategories();
  }
}


