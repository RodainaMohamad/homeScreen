import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/failure.dart';
import '../../data/model/response/ProductDM.dart';
import '../repo/homeRepo.dart';

@injectable
class GetAllProductsUseCase {
  HomeRepo repo;

  GetAllProductsUseCase(this.repo);

  Future<Either<Failure, List<ProductDM>>> execute() async {
    print('Executing getProducts');
    return await repo.getProducts();
  }
}