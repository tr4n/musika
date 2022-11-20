import 'package:get_it/get_it.dart';
import 'package:musium/common/common.dart';
import 'package:musium/data/platform/network/api/api.dart';
import 'package:musium/data/repository/repositories.dart';

final GetIt locator = GetIt.instance;

setupLocator() async {
  locator.registerSingleton(SharedPreManager());
  locator.registerLazySingleton(() => AppApi());
  locator.registerLazySingleton(() => ZingRepository(locator<AppApi>()));
}
