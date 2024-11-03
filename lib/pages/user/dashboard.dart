import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitor_me/backend/classes.dart';
import 'package:monitor_me/components/card.dart';
import 'package:monitor_me/components/glass_container.dart';
import 'package:monitor_me/pages/user/subject.dart';
import 'package:monitor_me/services/transitions.dart';
import 'package:provider/provider.dart';

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({super.key});

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  List subjects = [
    "Physics",
    "Chemistry",
    "Biology",
    "Elective Maths",
    "English Language",
    "Core Maths",
    "Social Studies"
  ];

  @override
  Widget build(BuildContext context) {
    final teacher = Provider.of<TeacherProvider>(context, listen: true).currentTeacher;
    subjects = teacher!.subjects!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 60),
        child: GlassContainer(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
          child: AppBar(
            // leadingWidth: 50,
            // foregroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const SizedBox(
                  height: 10,
                ),
                Text(
                  "Hello ${teacher.teacherInfo!['firstname']}",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 25
                  ),
                ),
               const SizedBox(
                  height: 15,
                ),
               Text(
                  "Subjects",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
             const   SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:subjects.length,
                  itemBuilder: (context, index) {
                    return SubjectCard(
                      title: subjects[index]['name'],
                      onPressed: () {
                        Navigator.push(context,
                            slideLeftTransition(UserSubjectPage(
                              title: subjects[index]
                            )));
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
