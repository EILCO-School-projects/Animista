import 'package:animista/api/services/auth_service.dart';
import 'package:animista/api/services/database_service.dart';
import 'package:animista/api/services/graphql_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void initializeDependencies() {
  getIt.registerSingleton<GraphQLService>(GraphQLService());
  getIt.registerSingleton<DatabaseService>(DatabaseService());
  getIt.registerSingleton<AuthService>(AuthService());
}
