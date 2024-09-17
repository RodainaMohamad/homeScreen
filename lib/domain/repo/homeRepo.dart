import 'package:dartz/dartz.dart';
import 'package:trial_hpg/data/model/response/CategoryDm.dart';
import 'package:trial_hpg/data/model/response/ProductDM.dart';
import '../../../data/model/failure.dart';

abstract class HomeRepo{

  Future<Either<Failure, List<categoryDM>>> getCategories();

  Future<Either<Failure,List<ProductDM>>> getProducts();

}