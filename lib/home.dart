import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildDashboardGrid(),
                const SizedBox(height: 20),
                _buildGradeChart(),
                const SizedBox(height: 20),
                _buildUpcomingEvents(),
                const SizedBox(height: 20),
                _buildRecentAnnouncements(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        tooltip: 'Quick Actions',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
    });
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Student ID: 12345678',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
          },
          child: const Hero(
            tag: 'profileAvatar',
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/student_avatar.png'),
              radius: 30,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDashboardGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildDashboardItem(Icons.book, 'Courses', Colors.blue, () {
        }),
        _buildDashboardItem(Icons.assignment, 'Assignments', Colors.green, () {
        }),
        _buildDashboardItem(Icons.calendar_today, 'Schedule', Colors.orange, () {
        }),
        _buildDashboardItem(Icons.grade, 'Grades', Colors.red, () {
        }),
      ],
    );
  }

  Widget _buildDashboardItem(IconData icon, String title, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeChart() {
    return const SizedBox(
      height: 200,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Grade Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Expanded(
                child: Center(
                  child: Text('Grade chart placeholder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingEvents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upcoming Events',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildEventItem('Math Exam', DateTime.now().add(const Duration(days: 2))),
        _buildEventItem('Science Project Due', DateTime.now().add(const Duration(days: 5))),
      ],
    );
  }

  Widget _buildEventItem(String title, DateTime date) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.event, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${date.day}/${date.month}/${date.year}'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
        },
      ),
    );
  }

  Widget _buildRecentAnnouncements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Announcements',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildAnnouncementItem('Upcoming Exam Schedule', 'Check the latest exam schedule for this semester.'),
        _buildAnnouncementItem('New Library Resources', 'New digital resources are now available in the online library.'),
      ],
    );
  }

  Widget _buildAnnouncementItem(String title, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
        },
      ),
    );
  }
}

class GradeData {
  final String subject;
  final int score;

  GradeData(this.subject, this.score);
}