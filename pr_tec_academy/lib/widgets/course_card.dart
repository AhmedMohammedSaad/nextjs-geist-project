import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:pr_tec_academy/config/theme.dart';

class CourseCard extends StatefulWidget {
  final Map<String, dynamic> course;

  const CourseCard({
    super.key,
    required this.course,
  });

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()
          ..scale(_isHovered ? 1.05 : 1.0),
        child: Card(
          elevation: _isHovered ? 16 : 8,
          shadowColor: widget.course['color'].withOpacity(0.3),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  PRTECTheme.cardColor,
                  PRTECTheme.cardColor.withOpacity(0.8),
                ],
              ),
              border: Border.all(
                color: _isHovered 
                    ? widget.course['color'].withOpacity(0.5)
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course icon/header
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: widget.course['color'].withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getCourseIcon(widget.course['title']),
                      color: widget.course['color'],
                      size: 30,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Course title
                  Text(
                    widget.course['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: PRTECTheme.textColor,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Course description
                  Text(
                    widget.course['description'],
                    style: const TextStyle(
                      color: PRTECTheme.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Course details
                  _buildDetailRow(Icons.signal_cellular_alt, widget.course['level']),
                  const SizedBox(height: 8),
                  _buildDetailRow(Icons.schedule, widget.course['duration']),
                  
                  const Spacer(),
                  
                  // Price and enroll button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.course['price'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: widget.course['color'],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: _isHovered ? [
                            BoxShadow(
                              color: widget.course['color'].withOpacity(0.4),
                              blurRadius: 12,
                              spreadRadius: 2,
                            ),
                          ] : null,
                        ),
                        child: ElevatedButton(
                          onPressed: () => context.go('/enroll'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: widget.course['color'],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                          child: const Text('Enroll'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: PRTECTheme.textSecondary,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            color: PRTECTheme.textSecondary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  IconData _getCourseIcon(String courseTitle) {
    switch (courseTitle.toLowerCase()) {
      case 'flutter development':
        return Icons.phone_android;
      case 'web development':
        return Icons.web;
      case 'backend development':
        return Icons.storage;
      case 'programming for kids':
        return Icons.child_care;
      default:
        return Icons.code;
    }
  }
}
