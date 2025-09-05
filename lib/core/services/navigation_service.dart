import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Go to route
  static void go(String routeName) {
    navigatorKey.currentContext?.go(routeName);
  }

  // Push new route
  static void push(String routeName) {
    navigatorKey.currentContext?.push(routeName);
  }

  // Replace with new route
  static void replace(String routeName) {
    navigatorKey.currentContext?.go(routeName);
  }

  // Pop current route
  static void pop() {
    navigatorKey.currentState?.pop();
  }

  /// CUSTOM TRANSITIONS

  // Slide from Right → Left
  static CustomTransitionPage slideFromRight(
    Widget child,
    GoRouterState state,
  ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        );
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  // Slide from Left → Right
  static CustomTransitionPage slideFromLeft(Widget child, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        );
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  // Slide from Bottom → Up
  static CustomTransitionPage slideFromBottom(
    Widget child,
    GoRouterState state,
  ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        );
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  // Slide from Top → Down
  static CustomTransitionPage slideFromTop(Widget child, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        );
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  // Fade Transition
  static CustomTransitionPage fade(Widget child, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
