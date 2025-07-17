import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:pr_tec_academy/config/theme.dart';

class PRTECNavigationBar extends StatefulWidget {
  const PRTECNavigationBar({super.key});

  @override
  State<PRTECNavigationBar> createState() => _PRTECNavigationBarState();
}

class _PRTECNavigationBarState extends State<PRTECNavigationBar> {
  bool _isScrolled = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: _isScrolled ? PRTECTheme.primaryColor.withOpacity(0.95) : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: _isScrolled ? PRTECTheme.accentColor.withOpacity(0.3) : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => context.go('/'),
              child: Text(
                'PR TEC Academy',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: PRTECTheme.textColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ).animate().fadeIn(duration: 600.ms).slideX(begin: -20),
            const Spacer(),
            if (!isMobile) ...[
              _buildNavItem('Home', '/'),
              _buildNavItem('About', '/about'),
              _buildNavItem('Courses', '/courses'),
              _buildNavItem('For Children', '/children'),
              _buildNavItem('Testimonials', '/testimonials'),
              _buildNavItem('Contact', '/contact'),
              const SizedBox(width: 16),
              _buildGlowButton('Enroll Now', '/enroll'),
            ] else ...[
              IconButton(
                icon: const Icon(Icons.menu, color: PRTECTheme.textColor),
                onPressed: () => _showMobileMenu(context),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () => context.go(route),
        child: Text(
          title,
          style: const TextStyle(
            color: PRTECTheme.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ).animate().fadeIn(delay: 200.ms).slideY(begin: -10);
  }

  Widget _buildGlowButton(String title, String route) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: PRTECTheme.accentColor.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => context.go(route),
        child: Text(title),
      ),
    ).animate().fadeIn(delay: 400.ms).scale(begin: const Offset(0.8, 0.8));
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: PRTECTheme.surfaceColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMobileNavItem('Home', '/'),
            _buildMobileNavItem('About', '/about'),
            _buildMobileNavItem('Courses', '/courses'),
            _buildMobileNavItem('For Children', '/children'),
            _buildMobileNavItem('Testimonials', '/testimonials'),
            _buildMobileNavItem('Contact', '/contact'),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: _buildGlowButton('Enroll Now', '/enroll'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileNavItem(String title, String route) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: PRTECTheme.textColor),
      ),
      onTap: () {
        Navigator.pop(context);
        context.go(route);
      },
    );
  }
}
