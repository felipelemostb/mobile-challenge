import 'package:mobile_challenge/core/dependency_injector/dependency_injector.dart';
import 'package:mobile_challenge/data/infra/client_http/dio_client.dart';
import 'package:mobile_challenge/data/infra/local_data_source/secure_storage_source.dart';
import 'package:mobile_challenge/domain/bloc/bloc_restaurant.dart';
import 'package:mobile_challenge/domain/use_case/restaurant_use_case.dart';

class AppModules {
  static DependencyInjector initDependencyInjector() {
    final dependencyInjector = DependencyInjector.instance();
    dependencyInjector.registerDependency<SecureStorageSource>(
      () => SecureStorageSource(),
    );
    dependencyInjector.registerDependency<DioClient>(
      () => DioClient(
        dependencyInjector.fetchDependency<SecureStorageSource>(),
      ),
    );
    dependencyInjector.registerDependency<RestaurantUseCase>(
      () => RestaurantUseCase(),
    );
    dependencyInjector.registerDependency<RestaurantController>(
      () => RestaurantController(
        dependencyInjector.fetchDependency<RestaurantUseCase>(),
      ),
    );
    return dependencyInjector;
  }
}
