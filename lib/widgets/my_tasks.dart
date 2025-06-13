// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
//
// class TaskItem extends StatelessWidget {
//   final String title;
//   final double progress;
//   final String dueDate;
//   final String status;
//   final String priority;
//   final String actionLabel;
//
//   const TaskItem({
//     super.key,
//     required this.title,
//     required this.progress,
//     required this.dueDate,
//     required this.status,
//     required this.priority,
//     required this.actionLabel,
//   });
//
//   Color getPriorityColor(String priority) {
//     switch (priority.toLowerCase()) {
//       case 'high':
//         return Colors.red;
//       case 'medium':
//         return Colors.orange;
//       default:
//         return Colors.grey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF0B5220),
//               ),
//             ),
//             const SizedBox(height: 12),
//             Wrap(
//               spacing: 8,
//               children: [
//                 _buildStatusIcon("Not Started"),
//                 _buildStatusIcon("In Progress"),
//                 _buildStatusIcon("Completed"),
//                 _buildStatusIcon("Overdue"),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 CircularPercentIndicator(
//                   radius: 28,
//                   lineWidth: 5,
//                   percent: progress.clamp(0.0, 1.0),
//                   center: Text("${(progress * 100).round()}%"),
//                   progressColor: Colors.green,
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Due: $dueDate", style: const TextStyle(fontSize: 13)),
//                       const SizedBox(height: 4),
//                       Text(
//                         "Assigned by: Team Lead",
//                         style: TextStyle(fontSize: 12, color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 _buildPriorityChip("Low"),
//                 const SizedBox(width: 8),
//                 _buildPriorityChip("Medium"),
//                 const SizedBox(width: 8),
//                 _buildPriorityChip("High"),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 OutlinedButton(onPressed: () {}, child: const Text("Start")),
//                 const SizedBox(width: 8),
//                 OutlinedButton(onPressed: () {}, child: const Text("Update")),
//                 const SizedBox(width: 8),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                   ),
//                   child: Text(actionLabel),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildStatusIcon(String label) {
//     bool active = status == label;
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(
//           Icons.radio_button_checked,
//           size: 16,
//           color: active ? Colors.green : Colors.grey[400],
//         ),
//         const SizedBox(width: 4),
//         Text(
//           label,
//           style: TextStyle(fontSize: 12),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPriorityChip(String label) {
//     bool selected = priority.toLowerCase() == label.toLowerCase();
//     return Chip(
//       label: Text(label),
//       backgroundColor: selected ? getPriorityColor(label).withOpacity(0.15) : Colors.grey[200],
//       labelStyle: TextStyle(color: getPriorityColor(label)),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// // import 'package:ui_design_flutter/widgets/task_item.dart';
//
// class Mytasks extends StatelessWidget {
//   const Mytasks({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final taskList = [
//       TaskItem(
//         title: 'Design Dashboard UI',
//         progress: 0.6,
//         dueDate: '2025-06-14',
//         status: 'In Progress',
//         priority: 'High',
//         actionLabel: 'Complete',
//       ),
//       TaskItem(
//         title: 'Fix Login Bug',
//         progress: 0.2,
//         dueDate: '2025-06-16',
//         status: 'Not Started',
//         priority: 'Medium',
//         actionLabel: 'Start',
//       ),
//       TaskItem(
//         title: 'Write API Documentation',
//         progress: 1.0,
//         dueDate: '2025-06-10',
//         status: 'Completed',
//         priority: 'Low',
//         actionLabel: 'View',
//       ),
//     ];
//
//     return Column(
//       children: taskList,
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Mytasks extends StatefulWidget {
  const Mytasks({super.key});

  @override
  State<Mytasks> createState() => _MytasksState();
}

class _MytasksState extends State<Mytasks> {
  int selectedTab = 0;
  String sortBy = "Deadline";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tab Selector
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _taskTab("My Tasks", 0),
              const SizedBox(width: 8),
              _taskTab("Task Tracker", 1),
              const SizedBox(width: 8),
              _taskTab("Ongoing & Pending", 2),
              const SizedBox(width: 8),
              _taskTab("Work Summary", 3),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Scrollable Content Area
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._getTaskList(),
                const SizedBox(height: 20),
                if (selectedTab == 3) _buildWorkSummary(),
                const SizedBox(height: 20),
                _buildSortOptions(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _taskTab(String label, int index) {
    final bool selected = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.indigo : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSortOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Sort by:", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Row(
              children: [
                Radio<String>(
                  value: "Deadline",
                  groupValue: sortBy,
                  onChanged: (value) => setState(() => sortBy = value!),
                ),
                const Text("Deadline"),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: "Project",
                  groupValue: sortBy,
                  onChanged: (value) => setState(() => sortBy = value!),
                ),
                const Text("Project"),
              ],
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _getTaskList() {
    switch (selectedTab) {
      case 0:
        return const [
          SimpleTaskItem(title: "UI/UX Design implementation", description: "Translating design specifications into functional and visually appealing user interfaces."),
          SimpleTaskItem(title: "Responsive Design", description: "Ensuring the app adapts to all screen sizes and devices."),
          SimpleTaskItem(title: "Back-end Development", description: "Creating and managing databases efficiently."),
          SimpleTaskItem(title: "Server-side Logic", description: "Developing and maintaining server-side logic for request handling."),
        ];
      case 1:
        return const [
          TrackerTaskItem(title: "Responsive Design", progress: 0.45, dueDate: "2 days", status: "In Progress", priority: "Medium", actionLabel: "Update"),
          TrackerTaskItem(title: "UI/UX Design Implementation", progress: 0.6, dueDate: "2 days", status: "In Progress", priority: "High", actionLabel: "Continue"),
          TrackerTaskItem(title: "Back-end Development", progress: 0.7, dueDate: "2 days", status: "In Progress", priority: "High", actionLabel: "Continue"),
        ];
      case 2:
        return const [
          SimpleTaskItem(title: "UI/UX Design Implementation", description: "Status: Ongoing Task \n• Start date: 12-06-2025 \n• Expected completion: 12-06-2025"),
          SimpleTaskItem(title: "Responsive Design", description: "Status: Pending Task \n• Start date: 12-06-2025 \n• Expected completion: 12-06-2025"),
          SimpleTaskItem(title: "Back-end Development", description: "Status: Pending Task \n• Start date: 12-06-2025 \n• Expected completion: 12-06-2025"),
        ];
      default:
        return [];
    }
  }

  Widget _buildWorkSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Work Summary", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Icon(Icons.calendar_month),
        Text("Total working Days: 20"),
        Text("🕒 12 hours tracked"),
        Text("📅 3 deadlines this week"),
      ],
    );
  }
}

class SimpleTaskItem extends StatelessWidget {
  final String title;
  final String description;

  const SimpleTaskItem({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(onPressed: () {}, child: const Text("Start")),
            ),
          ],
        ),
      ),
    );
  }
}

class TrackerTaskItem extends StatelessWidget {
  final String title;
  final double progress;
  final String dueDate;
  final String status;
  final String priority;
  final String actionLabel;

  const TrackerTaskItem({super.key, required this.title, required this.progress, required this.dueDate, required this.status, required this.priority, required this.actionLabel});

  Color getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0B5220))),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                _buildStatusIcon("Not Started"),
                _buildStatusIcon("In Progress"),
                _buildStatusIcon("Completed"),
                _buildStatusIcon("Overdue"),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                CircularPercentIndicator(
                  radius: 28,
                  lineWidth: 5,
                  percent: progress.clamp(0.0, 1.0),
                  center: Text("${(progress * 100).round()}%"),
                  progressColor: Colors.green,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Due: $dueDate", style: const TextStyle(fontSize: 13)),
                      const SizedBox(height: 4),
                      Text("Assigned by: Team Lead", style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildPriorityChip("Low"),
                const SizedBox(width: 8),
                _buildPriorityChip("Medium"),
                const SizedBox(width: 8),
                _buildPriorityChip("High"),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(onPressed: () {}, child: const Text("Start")),
                const SizedBox(width: 8),
                OutlinedButton(onPressed: () {}, child: const Text("Update")),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text(actionLabel),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIcon(String label) {
    bool active = status == label;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.radio_button_checked, size: 16, color: active ? Colors.green : Colors.grey[400]),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildPriorityChip(String label) {
    bool selected = priority.toLowerCase() == label.toLowerCase();
    return Chip(
      label: Text(label),
      backgroundColor: selected ? getPriorityColor(label).withOpacity(0.15) : Colors.grey[200],
      labelStyle: TextStyle(color: getPriorityColor(label)),
    );
  }
}


