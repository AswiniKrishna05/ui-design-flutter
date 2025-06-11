import 'package:flutter/material.dart';

const kHeaderGradient = [Color(0xFF0B5220), Color(0xFF6DA43F)];
const kBellBg = Color(0xFF05A9F5);
const kBtnCheckIn = Color(0xFF008CFF);
const kBtnCheckOut = Color(0xFFB8B8B8);
const kPresenceGreen = Color(0xFF0A9C44);
const kAbsenceRed = Color(0xFFCC2029);
const kLeaveOrange = Color(0xFFE67E00);
const kDashAttendance = Color(0xFF32C05E);
const kDashLeaves = Color(0xFFFF9D31);
const kDashLeaveStatus = Color(0xFFB063FF);
const kDashHoliday = Color(0xFF3267FF);
const kDashPayslip = Color(0xFF10B981);
const kDashReports = Color(0xFFFF5E5E);

void main() {
  runApp(MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _BottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _HeaderCard(),
              SizedBox(height: 40),
              Text(
                '“Good Morning,\nHemant Rangarajan”',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 12),
              _GreetingCard(),
              SizedBox(height: 24),
              Text('Overview',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 12),
              _OverviewRow(),
              SizedBox(height: 28),
              Text('Dashboard',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 12),
              _DashboardGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: _RibbonClipper(),
          child: Container(
            height: 64,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: kHeaderGradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            padding: const EdgeInsets.only(left: 8, right: 80),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/75.jpg'),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hemant Rangarajan',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12)),
                      Text('Full-stack Developer',
                          style:
                          TextStyle(color: Colors.white70, fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -2,
          right: 60,
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
              ],
            ),
            child: ClipOval(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi99uqUK8FwWSrGdEfRnU8vfQrJXoYHRZKOQ&s',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          right: 8,
          top: 4,
          child: Container(
            width: 40,
            height: 40,
            decoration:
            const BoxDecoration(shape: BoxShape.circle, color: kBellBg),
            child: const Icon(Icons.notifications, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _RibbonClipper extends CustomClipper<Path> {
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

class _GreetingCard extends StatelessWidget {
  const _GreetingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F8FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4EDED)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("You haven't Checked-in yet",
              style: TextStyle(color: Colors.red)),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.credit_score_rounded),
                  label: const Text('Check in'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBtnCheckIn,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(44),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.logout_rounded),
                  label: const Text('Check Out'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBtnCheckOut,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: kBtnCheckOut,
                    disabledForegroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(44),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _OverviewRow extends StatelessWidget {
  const _OverviewRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _OverviewCard(label: 'Presence', value: '20', colour: kPresenceGreen),
        _OverviewCard(label: 'Absence', value: '03', colour: kAbsenceRed),
        _OverviewCard(label: 'Leaves', value: '02', colour: kLeaveOrange),
      ],
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final String label;
  final String value;
  final Color colour;

  const _OverviewCard(
      {super.key,
        required this.label,
        required this.value,
        required this.colour});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 96,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFEFEFEF)),
          boxShadow: const [
            BoxShadow(
                color: Color(0x11000000), blurRadius: 4, offset: Offset(0, 2))
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: TextStyle(fontSize: 12, color: colour, height: 1)),
            Text(value,
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: colour)),
          ],
        ),
      ),
    );
  }
}

class _DashboardGrid extends StatelessWidget {
  const _DashboardGrid();

  @override
  Widget build(BuildContext context) {
    const items = [
      ('Attendance', Icons.calendar_today_rounded, kDashAttendance),
      ('Leaves', Icons.exit_to_app_rounded, kDashLeaves),
      ('Leave Status', Icons.pie_chart_outline_rounded, kDashLeaveStatus),
      ('Holiday List', Icons.checklist_rounded, kDashHoliday),
      ('Payslip', Icons.receipt_long_rounded, kDashPayslip),
      ('Reports', Icons.show_chart_rounded, kDashReports),
    ];

    return GridView.builder(
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.95,
      ),
      itemBuilder: (_, i) {
        final (label, icon, colour) = items[i];
        return _DashCard(label: label, icon: icon, colour: colour);
      },
    );
  }
}

class _DashCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color colour;

  const _DashCard(
      {super.key,
        required this.label,
        required this.icon,
        required this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEFEFEF)),
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Color(0x11000000), blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colour.withOpacity(0.15),
            ),
            child: Icon(icon, color: colour, size: 24),
          ),
          const SizedBox(height: 8),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: kBtnCheckIn,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.exit_to_app_sharp), label: 'Leave'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}