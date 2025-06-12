import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narra_apps/features/add_stories/views/add_stories.dart';
import 'package:narra_apps/features/auth/cubit/login_cubit.dart';
import 'package:narra_apps/features/auth/screens/login_screen.dart';
import 'package:narra_apps/features/auth/screens/register_screen.dart';
import 'package:narra_apps/features/home/screens/home_screen.dart';
import 'package:narra_apps/features/home/screens/main_home_scree.dart';
import 'package:narra_apps/features/stories/screens/detail_stories.dart';
import 'package:narra_apps/features/stories/screens/list_stories.dart';
import 'paths.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Paths.login,
  routes: [
    GoRoute(
      path: Paths.login,
      name: 'login',
      builder: (ctx, state) {
        return BlocProvider(
          create: (_) => LoginCubit(),
          child: const LoginScreen(),
        );
      },
    ),
    GoRoute(
      path: Paths.register,
      name: 'register',
      builder: (_, __) => const RegisterScreen(),
    ),

    ShellRoute(
      builder: (context, state, child) => MainHomeScreen(child: child),
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
          builder: (ctx, state) {
            return const LoginScreen();
          },
        ),
      ],
    ),
  ],
  errorBuilder:
      (ctx, state) => Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      ),
);
