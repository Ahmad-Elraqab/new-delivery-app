import 'package:get_it/get_it.dart';
import 'package:work_app/services/data_service.dart';
import 'package:work_app/services/screens_service/item_service.dart';
import 'package:work_app/services/screens_service/cart_service.dart';
import 'package:work_app/services/model_service/user_data_service.dart';

GetIt service = GetIt.instance;

void init() {
  service.registerLazySingleton(
    () => DataService(),
  );
  service.registerLazySingleton(
    () => UserDataService(),
  );
  service.registerLazySingleton(
    () => CartService(),
  );
  service.registerLazySingleton(
    () => ItemService(),
  );
}
