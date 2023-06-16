import 'package:command_interface/pages/dashboard/dashboard_page.dart';
import 'package:command_interface/pages/pumps/pumps_page.dart';
import 'package:go_router/go_router.dart';
import 'package:command_interface/Pages/home/home_page.dart';
import 'package:command_interface/Pages/sp_2000/sp_2000_page.dart';

// GoRouter configuration
final _router = GoRouter(
  initialLocation: '/',
  
  routes: [
    ShellRoute(
      builder: (context, state, child) => const DashboardPage(),
    routes: [
      GoRoute(
        name: 'home', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: 'SP2000',
        path: '/sp2000',
        builder: (context, state) => const Sp2000Page(),
      ),
      GoRoute(
        name: 'pumps',
        path: '/pumps',
        builder: (context, state) => const PumpsPage(),
      ),
    ],
    ),
  ],

);