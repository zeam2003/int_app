import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:int_app/config/router/app_router.notifier.dart';
import 'package:int_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:int_app/features/auth/presentation/screens/check_auth_status_screen.dart';
import 'package:int_app/features/auth/presentation/screens/login_screen.dart';
import 'package:int_app/features/dashboard/central_screen.dart';


final goRouterProvider = Provider((ref){

  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
  initialLocation: '/splash',
  refreshListenable: goRouterNotifier,
  routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const CentralScreen(),
      ),
    ],
    redirect: (context, state) {

      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) return null;
      if (authStatus == AuthStatus.noAuthenticated) {
        if (isGoingTo == '/login') return null;
        return '/login';
      }

      if( authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/splash') return '/';
        return null;
      }
      
      return null;
    }
  );
}); 

