import '../models/task.dart';

final List<Task> sampleTasks = [
  Task(
    title: 'Responsive Design',
    status: 'In Progress',
    progress: 45,
    daysRemaining: 2,
    priority: 'Medium',
    dueDate: '18-06-2025',
  ),
  Task(
    title: 'UI/UX Design Implementation',
    status: 'Completed',
    progress: 69,
    daysRemaining: 2,
    priority: 'High',
    dueDate: '18-06-2025',
    isCompleted: true,
  ),
];
