import 'package:dio/dio.dart';
import 'package:int_app/config/config.dart';
import 'package:int_app/features/auth/domain/domain.dart';
import 'package:int_app/features/auth/infraestructure/infraestructure.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: Environment.apiUrl,
  )
);

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get('/auth/user-details',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        }
      )
    );

    final user = UserMapper.userJsonToEntity(response.data);
    return user;
    } on DioException catch (e) {
        if(e.response?.statusCode == 401) throw WrongCredentials();
        if(e.type == DioExceptionType.connectionTimeout) throw ConnectonTimeout();

        
        throw CustomError('Something wrong happend', 1);
    } catch (e) {
      
      throw Exception();
    }
  }

  @override
  Future<User> login(String username, String password) async {
    
    try {
      final response = await dio.post('/auth/login', data: {
        'username': username,
        'password': password
      });
      
      final user = UserMapper.userJsonToEntity(response.data);
      
      return user;
    } on DioException catch (e) {
        if(e.response?.statusCode == 401) throw WrongCredentials();
        if(e.type == DioExceptionType.connectionTimeout) throw ConnectonTimeout();

        
        throw CustomError('Something wrong happend', 1);
    } catch (e) {
      
      throw Exception();
    }
  }

}


/* 
class AuthDatasourceImpl extends AuthDatasource {

  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
    )
  );



  @override
  Future<Login> checkAuthStatus(String token) async {
    print('token recibido en check, $token');
    try {
      final response = await dio.get('/auth/user-details',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          }
        )
      );
      //print('respum esta, $response');
      //final luser = LoginMapper.loginJsonToEntity(response.data);
      
      final luser = response.data['valid_id'];
      print('que recibo $luser');
      //print('respuesta final, $luser');
      return luser;
    } on DioException catch (e) {
        if(e.response?.statusCode == 401) throw CustomError('Token Incorrecto', 401);
        if(e.type == DioExceptionType.connectionTimeout) throw ConnectonTimeout();

        
        throw CustomError('Something wrong happend', 1);
    } catch (e) {
      
      throw Exception();
    }
  }

  @override
  Future<User> login(String username, String password)  async{
    
    try {
      final response = await dio.post('/auth/login', data: {
        'username': username,
        'password': password
      });

      final login = LoginMapper.loginJsonToEntity(response.data);
      
      return login;
    }  on DioException catch (e) {
        if(e.response?.statusCode == 401) throw WrongCredentials();
        if(e.type == DioExceptionType.connectionTimeout) throw ConnectonTimeout();

        
        throw CustomError('Something wrong happend', 1);
    } catch (e) {
      
      throw Exception();
    }
  }
} */