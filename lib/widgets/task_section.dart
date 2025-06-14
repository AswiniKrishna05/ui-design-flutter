import 'package:flutter/material.dart';
import 'package:ui_design_flutter/widgets/sort_filter_bar.dart';
import 'package:ui_design_flutter/widgets/task_my_tab.dart';
import 'package:ui_design_flutter/widgets/task_tab_bar.dart';
import 'package:ui_design_flutter/widgets/task_tracker.dart';
import 'package:ui_design_flutter/widgets/work_summary.dart';
import 'package:ui_design_flutter/widgets/ongoing_pending.dart'; // Ensure this exists

class TaskSection extends StatefulWidget {
  const TaskSection({super.key});

  @override
  State<TaskSection> createState() => _TaskSectionState();
}

class _TaskSectionState extends State<TaskSection> {
  int selectedTabIndex = 0;
  int selectedSortIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sort By / Filter Bar

        const SizedBox(height: 12),

        // Task Tab Bar
        TaskTabBar(
          selectedIndex: selectedTabIndex,
          onTabSelected: (index) {
            setState(() {
              selectedTabIndex = index;
            });
          },
        ),
        const SizedBox(height: 12),
        SortFilterBar(
          selectedSortIndex: selectedSortIndex,
          onSortSelected: (index) {
            setState(() {
              selectedSortIndex = index;
            });
          },
        ),
        // IndexedStack with fixed height
        SizedBox(
          height: 320,
          child: IndexedStack(
            index: selectedTabIndex,
            children: const [
              TaskMyTab(),         // My Tasks tab
              TaskTrackerTab(),    // Task Tracker tab
              OngoingPendingTab(), // Ongoing & Pending tab
              WorkSummaryTab(),    // Work Summary tab
            ],
          ),
        ),
      ],
    );
  }
}
