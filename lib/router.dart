import 'package:fago/Homepage/HomePage.dart';
import 'package:fago/screens/supabase/Authentication/loginpage.dart';
import 'package:fago/screens/onboarding.dart';
import 'package:fago/screens/supabase/Authentication/signuppage.dart';
import 'package:go_router/go_router.dart';

final route = GoRouter(
  initialLocation: '/HomePage',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) =>  OnboardingScreen(),
    ),
     GoRoute(
      path: '/signuppage',
      builder: (context, state) =>  signuppage(),
    ),
    GoRoute(
      path: '/loginpage',
      builder: (context, state) =>  loginpagescreen(),
    ),
     GoRoute(
      path: '/HomePage',
      builder: (context, state) =>  Homepage(),
    ),

  ]);