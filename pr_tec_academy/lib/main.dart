import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:go_router/go_router.dart';
import 'package:pr_tec_academy/config/theme.dart';
import 'package:pr_tec_academy/pages/home_page.dart';
import 'package:pr_tec_academy/pages/about_page.dart';
import 'package:pr_tec_academy/pages/courses_page.dart';
import 'package:pr_tec_academy/pages/children_page.dart';
import 'package:pr_tec_academy/pages/testimonials_page.dart';
import 'package:pr_tec_academy/pages/contact_page.dart';
import 'package:pr_tec_academy/pages/enroll_page.dart';

void main() {
  runApp(const PRTECApp());
}

class PRTECApp extends StatelessWidget {
  const PRTECApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PR TEC Academy - Learn Programming',
      debugShowCheckedModeBanner: false,
      theme: PRTECTheme.darkTheme,
      routerConfig: _router,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: '/courses',
      builder: (context, state) => const CoursesPage(),
    ),
    GoRoute(
      path: '/children',
      builder: (context, state) => const ChildrenPage(),
    ),
    GoRoute(
      path: '/testimonials',
      builder: (context, state) => const TestimonialsPage(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactPage(),
    ),
    GoRoute(
      path: '/enroll',
      builder: (context, state) => const EnrollPage(),
    ),
  ],
);
