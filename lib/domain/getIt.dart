// import 'package:get_it/get_it.dart';
//
// final getIt = GetIt.instance;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:trial_hpg/data/homeRepo/data_souces_impl/dataSourcesImplDs.dart';
import 'package:trial_hpg/data/homeRepo/homeRepo_impl.dart';
import 'package:trial_hpg/domain/repo/data_souces/homeDs.dart';
import 'package:trial_hpg/domain/repo/homeRepo.dart';
import 'package:trial_hpg/domain/use%20Cases/GetAllCategories_UseCase.dart';
import 'package:trial_hpg/domain/use%20Cases/GetAllProducts_UseCase.dart';
import 'package:trial_hpg/ui/tabs/homePage/HomeViewModel.dart';
import 'package:trial_hpg/ui/tabs/homePage/product_view_model.dart';

final GetIt locator=GetIt.instance;

Future<void> setLocator() async {
  locator.registerLazySingleton<Connectivity>(() => Connectivity()); // assuming Connectivity has a default constructor
  locator.registerLazySingleton<Client>(() => Client()); // register the http client
  locator.registerLazySingleton<HomeDs>(() => DataSourcesImpl()); // register DataSourcesImpl
  locator.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(locator<Connectivity>(), locator<HomeDs>()));
  locator.registerLazySingleton<GetAllCategoriesUseCase>(() => GetAllCategoriesUseCase(locator<HomeRepo>()));
  locator.registerLazySingleton<GetAllProductsUseCase>(() => GetAllProductsUseCase(locator<HomeRepo>()));
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel(locator<GetAllCategoriesUseCase>(), locator<GetAllProductsUseCase>()));
  locator.registerLazySingleton<ProductViewModel>(() => ProductViewModel(locator<GetAllProductsUseCase>()));
}
/*@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();*/