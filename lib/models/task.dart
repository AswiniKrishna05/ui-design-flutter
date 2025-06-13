class Task {
  final String title;
  final String status;
  final int progress;
  final int daysRemaining;
  final String priority;
  final String dueDate;
  final bool isCompleted;

  Task({
    required this.title,
    required this.status,
    required this.progress,
    required this.daysRemaining,
    required this.priority,
    required this.dueDate,
    this.isCompleted = false,
  });
}
