

import 'package:attendance/app/networkInfo/AppPref.dart';
import 'package:attendance/app/networkInfo/internet_ckeck.dart';
import 'package:attendance/data/datasource/remote/DataSource.dart';
import 'package:attendance/data/repositoryImp/BaseRepositoryImp.dart';
import 'package:attendance/domain/repository/BaseRepository.dart';
import 'package:attendance/presintation/login/cubit/logincubit.dart';
import 'package:attendance/presintation/login/loginusecase.dart';
import 'package:attendance/presintation/register/cubit/RegisterCubit.dart';
import 'package:attendance/presintation/register/usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance= GetIt.instance;

Future<void> initAppModule() async{
    //shared pref
  final sharedPref = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPref);
  //appPrefs
  instance.registerLazySingleton<AppPreferences>
    (() => AppPreferences(instance<SharedPreferences>()));

  //internet
  instance.registerLazySingleton<NetworkInfo>
    (() => NetworkInfoImpl(InternetConnectionChecker()));

  //dataSource
  instance.registerLazySingleton<BaseDataSource>
    (() => BaseDataSourceImp(instance<NetworkInfo>()));

  //repository
   instance.registerLazySingleton<BaseRepository>
     (() => BaseRepositoryImp(instance<BaseDataSource>()));


}

registerModule(){
  if(!GetIt.I.isRegistered<RegisterUseCase>()){
    instance.registerFactory<RegisterUseCase>
      (() => RegisterUseCase(instance<BaseRepository>()));
    instance.registerFactory<RegisterCubit>
      (() => RegisterCubit(instance<RegisterUseCase>()));
  }
}

loginModule(){
  if(!GetIt.I.isRegistered<LoginUseCase>()){
    instance.registerFactory<LoginUseCase>
      (() => LoginUseCase(instance<BaseRepository>()));
    instance.registerFactory<LoginCubit>
      (() => LoginCubit(instance<LoginUseCase>()));
  }
}