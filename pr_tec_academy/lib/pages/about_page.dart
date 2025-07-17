import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:pr_tec_academy/config/theme.dart';
import 'package:pr_tec_academy/widgets/navigation_bar.dart';
import 'package:pr_tec_academy/widgets/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PRTECNavigationBar(),
            _buildHeroSection(context),
            _buildMissionSection(context),
            _buildTeamSection(context),
            _buildStatsSection(context),
            const PRTECFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            PRTECTheme.primaryColor,
            PRTECTheme.surfaceColor,
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'About PR TEC Academy',
                style: isMobile 
                    ? Theme.of(context).textTheme.displayMedium
                    : Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 800.ms).slideY(begin: 30),
              
              const SizedBox(height: 24),
              
              Container(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Text(
                  'Empowering the next generation of programmers through innovative education, hands-on learning, and personalized mentorship.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: PRTECTheme.textSecondary,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ).animate().fadeIn(delay: 400.ms, duration: 800.ms),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMissionSection(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          Text(
            'Our Mission & Vision',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ).animate().fadeIn().slideY(begin: 30),
          
          const SizedBox(height: 48),
          
          ResponsiveGridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const ResponsiveGridDelegate(
              crossAxisExtent: 400,
              mainAxisSpacing: 32,
              crossAxisSpacing: 32,
            ),
            itemCount: _missionItems.length,
            itemBuilder: (context, index) {
              return _buildMissionCard(_missionItems[index])
                  .animate(delay: (index * 200).ms).fadeIn().slideY(begin: 30);
            },
          ),
          
          const SizedBox(height: 64),
          
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: PRTECTheme.cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: PRTECTheme.accentColor.withOpacity(0.3),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Our Story',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  'Founded in 2020, PR TEC Academy started with a simple vision: to make programming education accessible, engaging, and effective for learners of all ages. What began as a small coding bootcamp has grown into a comprehensive educational platform serving thousands of students worldwide.\n\nOur founders, experienced software engineers and educators, recognized the gap between traditional computer science education and the practical skills needed in today\'s tech industry. They created PR TEC Academy to bridge this gap with hands-on, project-based learning that prepares students for real-world challenges.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: PRTECTheme.textSecondary,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ).animate().fadeIn(delay: 600.ms).scale(),
        ],
      ),
    );
  }

  Widget _buildMissionCard(Map<String, String> item) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: PRTECTheme.accentColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                _getIconData(item['icon']!),
                color: PRTECTheme.accentColor,
                size: 40,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              item['title']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: PRTECTheme.textColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              item['description']!,
              style: const TextStyle(
                color: PRTECTheme.textSecondary,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: const BoxDecoration(
        color: PRTECTheme.surfaceColor,
      ),
      child: Column(
        children: [
          Text(
            'Meet Our Team',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ).animate().fadeIn(),
          
          const SizedBox(height: 16),
          
          Text(
            'Passionate educators and industry experts dedicated to your success',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: PRTECTheme.textSecondary,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 200.ms),
          
          const SizedBox(height: 48),
          
          ResponsiveGridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const ResponsiveGridDelegate(
              crossAxisExtent: 300,
              mainAxisSpacing: 32,
              crossAxisSpacing: 32,
            ),
            itemCount: _teamMembers.length,
            itemBuilder: (context, index) {
              return _buildTeamCard(_teamMembers[index])
                  .animate(delay: (index * 200).ms).fadeIn().scale();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTeamCard(Map<String, String> member) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: PRTECTheme.accentColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                Icons.person,
                color: PRTECTheme.accentColor,
                size: 40,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              member['name']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PRTECTheme.textColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              member['role']!,
              style: const TextStyle(
                color: PRTECTheme.accentColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              member['description']!,
              style: const TextStyle(
                color: PRTECTheme.textSecondary,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          Text(
            'Our Impact',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ).animate().fadeIn(),
          
          const SizedBox(height: 48),
          
          ResponsiveGridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const ResponsiveGridDelegate(
              crossAxisExtent: 250,
              mainAxisSpacing: 32,
              crossAxisSpacing: 32,
            ),
            itemCount: _stats.length,
            itemBuilder: (context, index) {
              return _buildStatCard(_stats[index])
                  .animate(delay: (index * 200).ms).fadeIn().slideY(begin: 30);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(Map<String, String> stat) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: PRTECTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: PRTECTheme.accentColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            stat['number']!,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: PRTECTheme.accentColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            stat['label']!,
            style: const TextStyle(
              fontSize: 16,
              color: PRTECTheme.textColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'mission':
        return Icons.flag;
      case 'vision':
        return Icons.visibility;
      case 'values':
        return Icons.favorite;
      default:
        return Icons.star;
    }
  }
}

final List<Map<String, String>> _missionItems = [
  {
    'icon': 'mission',
    'title': 'Our Mission',
    'description': 'To provide world-class programming education that empowers individuals to build innovative solutions and advance their careers in technology.',
  },
  {
    'icon': 'vision',
    'title': 'Our Vision',
    'description': 'To be the leading platform for programming education, making coding skills accessible to everyone, everywhere.',
  },
  {
    'icon': 'values',
    'title': 'Our Values',
    'description': 'Excellence in education, innovation in teaching methods, inclusivity for all learners, and commitment to student success.',
  },
];

final List<Map<String, String>> _teamMembers = [
  {
    'name': 'Sarah Johnson',
    'role': 'Founder & CEO',
    'description': 'Former Google engineer with 10+ years of experience in software development and education.',
  },
  {
    'name': 'Michael Chen',
    'role': 'Lead Flutter Instructor',
    'description': 'Flutter expert and mobile app developer with 8 years of industry experience.',
  },
  {
    'name': 'Emily Rodriguez',
    'role': 'Web Development Lead',
    'description': 'Full-stack developer specializing in React, Node.js, and modern web technologies.',
  },
  {
    'name': 'David Kim',
    'role': 'Backend Specialist',
    'description': 'Senior backend engineer with expertise in Python, Django, and cloud architecture.',
  },
];

final List<Map<String, String>> _stats = [
  {
    'number': '5000+',
    'label': 'Students Taught',
  },
  {
    'number': '95%',
    'label': 'Job Placement Rate',
  },
  {
    'number': '50+',
    'label': 'Countries Reached',
  },
  {
    'number': '4.9',
    'label': 'Average Rating',
  },
];
