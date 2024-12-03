
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:int_app/features/shared/infraestructure/services/key_value_storage_service.dart';
import 'package:int_app/features/shared/infraestructure/services/key_value_storage_service_impl.dart';
import '../../domain/domain.dart';
import '../../infraestructure/infraestructure.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return AuthNotifier(
    authRepository: authRepository,
    keyValueStorageService: keyValueStorageService
  );
});

class AuthNotifier extends StateNotifier<AuthState> {

  final AuthRepository authRepository;
  final KeyValueStorageService keyValueStorageService;

  AuthNotifier({
    required this.authRepository,
    required this.keyValueStorageService,
  }): super(AuthState()) {
    checkAuthStatus();
  }

 Future<void>  loginUser(String username, String password) async { 
    try {
      final user = await authRepository.login(username, password);
      _setLoggedUser(user);
    } on WrongCredentials {
      logout( 'Credenciales no son correctas');
    } on ConnectonTimeout {
      logout( 'Se agotó el tiempo de espera');
    } catch (e) {
      
      logout('Error no controlado');
    }
  }

  void checkAuthStatus() async {
    final token = await keyValueStorageService.getValue<String>('token');

    if(token == null) return logout();

    try {
      final user = await authRepository.checkAuthStatus(token);
      _setLoggedUser(user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout();
    }

  }

  void _setLoggedUser( User user) async {
    
    await keyValueStorageService.setKeyValue('token', user.sessionToken);
    state = state.copyWith(
      user: user,
      errorMessage: '',
      authStatus: AuthStatus.authenticated,
    );
    
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStorageService.removeKey('token');
    state = state.copyWith(
      user: null,
      errorMessage: errorMessage,
      authStatus: AuthStatus.noAuthenticated,
    );
  }
}

enum AuthStatus {checking, authenticated, noAuthenticated}

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = ''
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage, 
  }) => AuthState(
    authStatus: authStatus ?? this.authStatus,
    user: user ?? this.user,
    errorMessage: errorMessage ?? this.errorMessage
  );


}