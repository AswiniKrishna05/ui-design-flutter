import 'package:flutter/material.dart';

class OngoingPendingTasksContent extends StatelessWidget {
  const OngoingPendingTasksContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        OngoingPendingTaskItem(
          title: 'UI/UX Design Implementation',
          status: 'Ongoing Task',
          startDate: '12-06-2025',
          expectedCompletion: '12-06-2025',
        ),
        OngoingPendingTaskItem(
          title: 'Responsive Design',
          status: 'Pending Task',
          startDate: '12-06-2025',
          expectedCompletion: '12-06-2025',
        ),
        OngoingPendingTaskItem(
          title: 'Back-end Development',
          status: 'Pending Task',
          startDate: '12-06-2025',
          expectedCompletion: '12-06-2025',
        ),
      ],
    );
  }
}

class OngoingPendingTaskItem extends StatelessWidget {
  final String title;
  final String status;
  final String startDate;
  final String expectedCompletion;

  const OngoingPendingTaskItem({
    super.key,
    required this.title,
    required this.status,
    required this.startDate,
    required this.expectedCompletion,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: $status',
              style: TextStyle(color: status.contains('Ongoing') ? Colors.blue : Colors.orange),
            ),
            Text(
              '• Start date: $startDate',
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              '• Expected completion: $expectedCompletion',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
} 