import 'package:flutter/material.dart';
import 'package:ui_design_flutter/widgets/bottom_bar.dart';
import 'package:ui_design_flutter/widgets/dashboard_grid.dart';
import 'package:ui_design_flutter/widgets/greetingCard.dart';
import 'package:ui_design_flutter/widgets/headerCard.dart';
import 'package:ui_design_flutter/widgets/my_tasks.dart';
import 'package:ui_design_flutter/widgets/overview_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderCard(),
              SizedBox(height: 40),
              Text(
                "Good Morning,\nHemant Rangarajan",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 12),
              GreetingCard(),
              SizedBox(height: 24),
              Text(
                'Overview',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              OverviewRow(),
              SizedBox(height: 28),
              Mytasks(),
              Text(
                'Dashboard',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              DashboardGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class RibbonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const r = 26.0;
    final path = Path()
      ..lineTo(size.width - r, 0)
      ..quadraticBezierTo(size.width, 0, size.width, r)
      ..lineTo(size.width, size.height - r)
      ..quadraticBezierTo(size.width, size.height, size.width - r, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(_) => false;
}