import 'package:get_it/get_it.dart';
import 'package:musium/data/platform/network/api/api.dart';
import 'package:musium/data/repository/repositories.dart';

final GetIt locator = GetIt.instance;

setupLocator() async {
  locator.registerLazySingleton(() => ZingMp3Api());
  locator.registerLazySingleton(() => ZingRepository(locator<ZingMp3Api>()));
}
