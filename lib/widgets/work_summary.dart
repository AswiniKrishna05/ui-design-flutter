import 'package:flutter/material.dart';

class WorkSummaryTab extends StatelessWidget {
  const WorkSummaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column
            Expanded(
              child: Column(
                children: const [
                  SummaryCard(
                    title: "Total Working Days",
                    value: "20",
                    icon: Icons.calendar_today,
                  ),
                  SizedBox(height: 12),
                  SummaryCard(
                    title: "Average Daily Hours",
                    value: "8.0 hours",
                    icon: Icons.av_timer,
                  ),
                  SizedBox(height: 12),
                  SummaryCard(
                    title: "Projects Involved",
                    value: "Revenue Dashboard",
                    icon: Icons.person,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Right Column
            Expanded(
              child: Column(
                children: const [
                  SummaryCard(
                    title: "Total Hours Worked",
                    value: "160 hours",
                    icon: Icons.access_time,
                  ),
                  SizedBox(height: 12),
                  SummaryCard(
                    title: "Productivity Indicator",
                    value: "80%",
                    icon: Icons.bar_chart,
                  ),
                  SizedBox(height: 12),
                  SummaryCard(
                    title: "Leave Taken",
                    value: "2 days",
                    icon: Icons.event_note,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 100), // Make all cards minimum height
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 28, color: Colors.teal),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
