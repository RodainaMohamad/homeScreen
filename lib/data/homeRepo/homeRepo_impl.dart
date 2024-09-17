import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:trial_hpg/data/model/failure.dart';
import 'package:trial_hpg/data/model/response/CategoryDm.dart';
import 'package:trial_hpg/data/model/response/ProductDM.dart';
import 'package:trial_hpg/domain/repo/data_souces/homeDs.dart';
import 'package:trial_hpg/domain/repo/homeRepo.dart';
import 'package:trial_hpg/ui/utilities/constants/consts.dart';
import 'package:trial_hpg/ui/utilities/extensions/extensions.dart';

@injectable
class HomeRepoImpl extends HomeRepo {
  Connectivity connectivity;
  HomeDs ds;

  HomeRepoImpl(this.connectivity, this.ds);

  @override
  Future<Either<Failure, List<categoryDM>>> getCategories() async {
    if (await connectivity.isConnected()) {
      ds.getCategories();
    } else {
      return Left(Failure(Consts.errorMessage));
    }
    return Left(Failure(Consts.errorMessage));
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getProducts() async {
    if (await connectivity.isConnected()) {
      ds.getProducts();
    } else {
      return Left(Failure(Consts.errorMessage));
    }
    return Left(Failure(Consts.errorMessage));
  }
}