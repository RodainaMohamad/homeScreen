
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:trial_hpg/ui/utilities/extensions/extensions.dart';

import '../../domain/repo/data_souces/homeDs.dart';
import '../../domain/repo/homeRepo.dart';
import '../../ui/utilities/constants/consts.dart';
import '../model/failure.dart';
import '../model/response/categoryDm.dart';
import '../model/response/ProductDM.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final Connectivity connectivity;
  final HomeDs ds;

  HomeRepoImpl(this.connectivity, this.ds);

  @override
  Future<Either<Failure, List<categoryDM>>> getCategories() async {
    print('Fetching categories from repository');

      return ds.getCategories();  // Directly return since it's already a Future<Either>

  }

  @override
  Future<Either<Failure, List<ProductDM>>> getProducts() async {
    print('Fetching products from repository');
    return ds.getProducts();
    if (await connectivity.isConnected()) {
        // Directly return since it's already a Future<Either>
    } else {
      return Left(Failure(Consts.noInternetConnection));
    }
  }
}
