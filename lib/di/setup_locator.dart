
import 'package:get_it/get_it.dart';
import 'package:providertest/core/viewmodels/hoem_viewmodel.dart';
import 'package:providertest/core/viewmodels/login_viewmodel.dart';
import 'package:providertest/services/network/api.dart';
import 'package:providertest/services/network/auth_service.dart';

GetIt locator = GetIt.instance;
void setupLocator(){
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => Api());


  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());

}