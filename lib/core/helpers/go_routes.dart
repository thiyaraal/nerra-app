import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narra_apps/core/utils/go_router_refresh.dart';
import 'package:narra_apps/features/add_stories/views/add_stories.dart';
import 'package:narra_apps/features/auth/login/cubit/auth_cubit.dart';
import 'package:narra_apps/features/auth/login/cubit/login_cubit.dart';
import 'package:narra_apps/features/auth/login/screens/login_screen.dart';
import 'package:narra_apps/features/auth/register/cubit/register_cubit.dart';
import 'package:narra_apps/features/auth/register/screen/register_screen.dart';
import 'package:narra_apps/features/home/screens/home_screen.dart';
import 'package:narra_apps/features/home/screens/main_home_scree.dart';
import 'package:narra_apps/features/stories/screens/detail_stories.dart';
import 'package:narra_apps/features/stories/screens/list_stories.dart';
import 'paths.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GoRouter buildAppRouter(BuildContext context) {
  final authCubit = context.read<AuthCubit>();

  return GoRouter(
    initialLocation: Paths.login,
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    routes: [
      GoRoute(
        path: Paths.login,
        name: 'login',
        builder:
            (_, __) => BlocProvider(
              create: (_) => LoginCubit(),
              child: const LoginScreen(),
            ),
      ),

      GoRoute(
        path: Paths.register,
        name: 'register',
        builder:
            (_, __) => BlocProvider(
              create: (_) => RegisterCubit(),
              child: const RegisterScreen(),
            ),
      ),
      ShellRoute(
        builder: (ctx, state, child) => MainHomeScreen(child: child),
        routes: [
          GoRoute(
            path: Paths.home,
            name: 'home',
            builder: (_, __) => const HomeScreen(),
          ),
          GoRoute(
            path: Paths.listStories,
            name: 'list-stories',
            builder: (_, __) => const ListStoriesScreen(),
          ),
          GoRoute(
            path: Paths.addStories,
            name: 'add-stories',
            builder: (_, __) => const AddStoriesScreen(),
          ),
          GoRoute(
            path: Paths.detailStories,
            name: 'detail-stories',
            builder: (_, __) => const DetailStoriesScreen(),
          ),
          GoRoute(
            path: Paths.logout,
            name: 'logout',
            builder: (_, __) => const LoginScreen(),
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final loggedIn = context.read<AuthCubit>().state;
      final goingToAuth =
          state.uri.toString() == Paths.login ||
          state.uri.toString() == Paths.register;

      if (!loggedIn && !goingToAuth) return Paths.login;
      if (loggedIn && goingToAuth) return Paths.home;
      return null;
    },

    errorBuilder:
        (_, __) => Scaffold(
          appBar: AppBar(title: const Text('404')),
          body: const Center(child: Text('Page not found')),
        ),
  );
}
