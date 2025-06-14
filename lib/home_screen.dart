import 'package:flutter/material.dart';
import 'package:ui_design_flutter/widgets/bottom_bar.dart';
import 'package:ui_design_flutter/widgets/dashboard_grid.dart';
import 'package:ui_design_flutter/widgets/greetingCard.dart';
import 'package:ui_design_flutter/widgets/headerCard.dart';
import 'package:ui_design_flutter/widgets/overview_row.dart';
import 'package:ui_design_flutter/widgets/task_section.dart';

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
            children:  [
              HeaderCard(),
              SizedBox(height: 40),
              Text(
                "Good Morning,\nHemant Rangarajan",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
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
              TaskSection(),
              Divider(thickness: 1,),
              SizedBox(height: 24),
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
