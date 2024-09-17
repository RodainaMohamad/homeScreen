import 'package:dartz/dartz.dart';
import 'package:trial_hpg/data/model/response/ProductDM.dart';
import 'package:trial_hpg/data/model/response/categoryDm.dart';
import '../../../data/model/failure.dart';

abstract class HomeDs{

  Future<Either<Failure, List<categoryDM>>> getCategories();

  Future<Either<Failure,List<ProductDM>>> getProducts();

}