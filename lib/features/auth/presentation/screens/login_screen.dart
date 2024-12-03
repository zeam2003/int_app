import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:int_app/features/auth/presentation/providers/auth_provider.dart';

import 'package:int_app/features/auth/presentation/providers/login_form_provider.dart';
import 'package:int_app/features/shared/shared.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: GeometricalBackground( 
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox( height: 80 ),
                // Icon Banner
                const Icon( 
                  Icons.published_with_changes_rounded, 
                  
                  color: Colors.white,
                  size: 100,
                ),
                const Text('Integral', style: TextStyle(color: Colors.white),),
                const SizedBox( height: 80 ),
    
                Container(
                  height: size.height - 260, // 80 los dos sizebox y 100 el ícono
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(100)),
                  ),
                  child: const _LoginForm(),
                )
              ],
            ),
          )
        )
      ),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm();

  void showSnackbar( BuildContext context, String message ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final loginForm = ref.watch(loginFormProvider);
    ref.listen(authProvider,(previous, next) {
      if( next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
    });

    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox( height: 50 ),
          Text('Login', style: textStyles.titleLarge ),
          //Text('Integral APP',style: textStyles.labelLarge,),
          const SizedBox( height: 30 ),

          CustomTextFormField(
            label: 'Usuario',
            keyboardType: TextInputType.name,
            onChanged: ref.read(loginFormProvider.notifier).onUsernameChange,
            errorMessage: loginForm.isFormPosted ?
              loginForm.username.errorMessage 
              : null,
          ),
          const SizedBox( height: 30 ),

          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: ref.read(loginFormProvider.notifier).onPasswordChange,
            onFieldSubmitted: (_) => ref.read(loginFormProvider.notifier).onFormSubmit,
            errorMessage: loginForm.isFormPosted ? 
              loginForm.password.errorMessage
              : null,
          ),
    
          const SizedBox( height: 30 ),

          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomFilledButton(
              text: 'Ingresar',
              buttonColor: Colors.black,
              onPressed:
                loginForm.isPosting ? null :
               () {
                ref.read(loginFormProvider.notifier).onFormSubmit();
              }
            )
          ),

          const Spacer( flex: 2 ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿No tienes cuenta?'),
              TextButton(
                onPressed: 
                ()=> context.push('/register'), 
                child: const Text('Crea una aquí')
              )
            ],
          ),

          const Spacer( flex: 1),
        ],
      ),
    );
  }
}


/* 
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:int_app/config/config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  // Dio
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      
    )
  );

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'username': _usernameController.text,
          'password': _passwordController.text,
        },
      );
      if (response.statusCode == 200 && response.data['success'] == true) {
        // Redirigir a DashboardScreen si la autenticación es exitosa
        context.go('/dashboard');
      } else {
        // Mostrar mensaje de error de autenticación fallida
        _showSnackbar('Credenciales incorrectas');
      }
    } on DioException catch (e) {
      // Manejo de errores específicos de Dio
      print(e);
      String errorMessage = 'Error al iniciar sesión';
      if (e.response != null) {
        errorMessage = e.response?.data['message'] ?? 'Error de servidor';
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Tiempo de conexión agotado';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Tiempo de respuesta agotado';
      }
      _showSnackbar(errorMessage);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

   void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Iniciar Sesión',
              style: GoogleFonts.roboto(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _login();// Lógica de inicio de sesión aquí
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Ingresar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
             
                
          ],
        ),
      ),
    );
  }
 */