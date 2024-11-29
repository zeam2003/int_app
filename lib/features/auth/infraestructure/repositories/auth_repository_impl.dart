
import 'package:int_app/features/auth/domain/domain.dart';
import 'package:int_app/features/auth/infraestructure/infraestructure.dart';

class AuthRepositoryImpl extends AuthRepository {

  final AuthDataSource datasource;
  AuthRepositoryImpl(
    [AuthDataSource? datasource]
  ) : datasource = datasource ?? AuthDataSourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return datasource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String username, String password) {
    return datasource.login(username, password);
  }

}

/* class AuthRepositoryImpl extends AuthRepository{

  final AuthDatasource dataSource;

  AuthRepositoryImpl(
    [AuthDatasource? dataSource]
    ) : dataSource = dataSource ?? AuthDatasourceImpl();

  @override
  Future<Login> checkAuthStatus(String token) {
    return dataSource.checkAuthStatus(token);
  }

  @override
  Future<Login> login(String username, String password) {
    return dataSource.login(username, password);
  }

} */