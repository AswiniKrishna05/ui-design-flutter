import 'package:flutter/material.dart';

class TaskTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const TaskTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 16),
            _buildTabButton("My Tasks", 0, Icons.calendar_today),
            const SizedBox(width: 8),
            _buildTabButton("Task Tracker", 1, Icons.hourglass_bottom),
            const SizedBox(width: 8),
            _buildTabButton(
                "Ongoing & pending Tasks", 2, Icons.refresh),
            const SizedBox(width: 8),
            _buildTabButton("Work Summary", 3, Icons.movie),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index, IconData icon) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 2),
            )
          ]
              : [],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}