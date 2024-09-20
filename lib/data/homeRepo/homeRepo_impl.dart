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

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  Connectivity connectivity;
  HomeDs ds;
  HomeRepoImpl(this.connectivity, this.ds);

  @override
  Future<Either<Failure, List<categoryDM>>> getCategories() async {
    print('Fetching categories from repository');
    if (await connectivity.isConnected()) {
      try {
        // Attempt to fetch categories
        final categories = await ds.getCategories();
        // Ensure the correct type is returned
        if (categories is List<categoryDM>) {
          return Right(categories as List<categoryDM>);
        } else {
          print("Invalid data format");
          return Left(Failure("Invalid data format received from data source"));
        }
      } catch (error) {
        print("Error while fetching categories: $error");
        return Left(Failure(Consts.errorMessage));
      }
    } else {
      print("No connection");
      return Left(Failure(Consts.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getProducts() async {
    print('Fetching products from repository');
    if (await connectivity.isConnected()) {
      try {
        final products = await ds.getProducts();
        return Right(products as List<ProductDM>);
      } catch (e) {
        return Left(Failure(Consts.errorMessage));
      }
    } else {
      return Left(Failure(Consts.errorMessage));
    }
  }
}