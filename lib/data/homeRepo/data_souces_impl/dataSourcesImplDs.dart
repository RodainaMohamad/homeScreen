import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:trial_hpg/data/model/failure.dart';
import 'package:trial_hpg/data/model/response/CategoriesResponse.dart';
import 'package:trial_hpg/data/model/response/ProductDM.dart';
import 'package:trial_hpg/data/model/response/ProductResponse.dart';
import 'package:trial_hpg/data/model/response/categoryDm.dart';
import 'package:trial_hpg/ui/utilities/constants/end_points.dart';
import '../../../domain/repo/data_souces/homeDs.dart';
import '../../../ui/utilities/constants/consts.dart';

@Injectable(as:HomeDs)
class DataSourcesImpl extends HomeDs {
  @override
  Future<Either<Failure, List<categoryDM>>> getCategories() async {
    try{
      Uri url = Uri.https(Endpoints.baseUrl, Endpoints.categories);
      Response serverResponse = await get(url);
      var myResponse = CategoriesResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 &&
          myResponse.data?.isNotEmpty == true) {return Right(myResponse.data!);}
      else{
        return Left(Failure(myResponse.message ?? Consts.errorMessage));
      }
    }
    catch(error){
      print(("Exception to be solved"));
      return Left(Failure(Consts.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getProducts() async {
   try{
     Uri url = Uri.https(Endpoints.baseUrl, Endpoints.products);
     Response serverResponse = await get(url);
     var myResponse = ProductResponse.fromJson(jsonDecode(serverResponse.body));
     if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 &&
         myResponse.data?.isNotEmpty == true) {return Right(myResponse.data!);}
     else{
       return Left(Failure(myResponse.message ?? Consts.errorMessage));
     }
   }
   catch(error){
     print(("Exception to be solved"));
     return Left(Failure(Consts.errorMessage));
   }
  }
}