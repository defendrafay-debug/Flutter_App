import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/auth_controller.dart';
import 'package:flutter_app/models/subject_model.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/screens/detail_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';

class DashboardScreen extends StatelessWidget {
  final UserModel user;

  DashboardScreen({
    super.key,
    required this.user,
  });

  final AuthController _authController = AuthController();

  final List<SubjectModel> subjects = [
    SubjectModel(
      name: 'Mobile App Development',
      description:
          'This course covers mobile application development concepts using Flutter. Students learn UI design, navigation, state management, forms, validation, and app deployment basics.',
      schedule: 'Monday & Wednesday, 10:00 AM - 11:30 AM',
      instructor: 'Ms. Roshana Mughal',
      room: 'Lab 2',
    ),
    SubjectModel(
      name: 'Software Re-engineering',
      description:
          'This course focuses on analyzing, improving, restructuring, and maintaining existing software systems. It includes reverse engineering, refactoring, and software quality improvement.',
      schedule: 'Tuesday & Thursday, 12:00 PM - 1:30 PM',
      instructor: 'Ms. Anusha',
      room: 'Room 204',
    ),
    SubjectModel(
      name: 'Management Information Systems (MIS)',
      description:
          'This course introduces the role of information systems in organizations. It covers decision support systems, enterprise systems, business processes, and management reporting.',
      schedule: 'Friday, 9:00 AM - 12:00 PM',
      instructor: 'Mr. Conrad D silva',
      room: 'Room 108',
    ),
  ];

  Future<void> _logout(BuildContext context) async {
    await _authController.logout();

    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 34,
                        backgroundColor: Colors.indigo,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 38,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome,',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              user.fullName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(user.email),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Subjects',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  itemCount: subjects.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final subject = subjects[index];

                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.indigo.shade100,
                          child: const Icon(
                            Icons.menu_book,
                            color: Colors.indigo,
                          ),
                        ),
                        title: Text(
                          subject.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(subject.schedule),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(
                                subject: subject,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}