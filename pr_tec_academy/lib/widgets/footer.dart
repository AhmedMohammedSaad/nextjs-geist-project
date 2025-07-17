import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:pr_tec_academy/config/theme.dart';

class PRTECFooter extends StatelessWidget {
  const PRTECFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return Container(
      decoration: const BoxDecoration(
        color: PRTECTheme.surfaceColor,
        border: Border(
          top: BorderSide(
            color: PRTECTheme.accentColor,
            width: 2,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          children: [
            if (isMobile) ...[
              _buildMobileFooter(context),
            ] else ...[
              _buildDesktopFooter(context),
            ],
            const SizedBox(height: 32),
            const Divider(color: PRTECTheme.accentColor),
            const SizedBox(height: 16),
            _buildBottomSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildBrandSection(context),
        ),
        Expanded(
          child: _buildQuickLinks(context),
        ),
        Expanded(
          child: _buildCourses(context),
        ),
        Expanded(
          child: _buildContact(context),
        ),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      children: [
        _buildBrandSection(context),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(child: _buildQuickLinks(context)),
            Expanded(child: _buildCourses(context)),
          ],
        ),
        const SizedBox(height: 32),
        _buildContact(context),
      ],
    );
  }

  Widget _buildBrandSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PR TEC Academy',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: PRTECTheme.textColor,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn().slideX(begin: -20),
        
        const SizedBox(height: 16),
        
        Text(
          'Empowering the next generation of programmers with comprehensive courses for all skill levels.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: PRTECTheme.textSecondary,
            height: 1.6,
          ),
        ).animate().fadeIn(delay: 200.ms),
        
        const SizedBox(height: 24),
        
        _buildSocialMedia().animate().fadeIn(delay: 400.ms),
      ],
    );
  }

  Widget _buildQuickLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: PRTECTheme.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('Home', '/'),
        _buildFooterLink('About Us', '/about'),
        _buildFooterLink('Testimonials', '/testimonials'),
        _buildFooterLink('Contact', '/contact'),
        _buildFooterLink('Enroll Now', '/enroll'),
      ],
    ).animate().fadeIn(delay: 300.ms);
  }

  Widget _buildCourses(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Courses',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: PRTECTheme.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('Flutter Development', '/courses'),
        _buildFooterLink('Web Development', '/courses'),
        _buildFooterLink('Backend Development', '/courses'),
        _buildFooterLink('Programming Basics', '/courses'),
        _buildFooterLink('Kids Programming', '/children'),
      ],
    ).animate().fadeIn(delay: 400.ms);
  }

  Widget _buildContact(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Info',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: PRTECTheme.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildContactItem(Icons.email, 'info@prtecacademy.com'),
        _buildContactItem(Icons.phone, '+1 (555) 123-4567'),
        _buildContactItem(Icons.location_on, '123 Tech Street, Code City'),
        _buildContactItem(Icons.schedule, 'Mon-Fri: 9AM-6PM'),
      ],
    ).animate().fadeIn(delay: 500.ms);
  }

  Widget _buildFooterLink(String title, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Builder(
        builder: (context) => GestureDetector(
          onTap: () => context.go(route),
          child: Text(
            title,
            style: const TextStyle(
              color: PRTECTheme.textSecondary,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: PRTECTheme.accentColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: PRTECTheme.textSecondary,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMedia() {
    return Row(
      children: [
        _buildSocialIcon(Icons.facebook, 'Facebook'),
        const SizedBox(width: 16),
        _buildSocialIcon(Icons.alternate_email, 'Twitter'),
        const SizedBox(width: 16),
        _buildSocialIcon(Icons.camera_alt, 'Instagram'),
        const SizedBox(width: 16),
        _buildSocialIcon(Icons.video_library, 'YouTube'),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String platform) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: PRTECTheme.accentColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: PRTECTheme.accentColor.withOpacity(0.3),
        ),
      ),
      child: Icon(
        icon,
        color: PRTECTheme.accentColor,
        size: 20,
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '© 2024 PR TEC Academy. All rights reserved.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: PRTECTheme.textSecondary,
          ),
        ),
        Row(
          children: [
            Text(
              'Privacy Policy',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: PRTECTheme.textSecondary,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              'Terms of Service',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: PRTECTheme.textSecondary,
              ),
            ),
          ],
        ),
      ],
    ).animate().fadeIn(delay: 600.ms);
  }
}
