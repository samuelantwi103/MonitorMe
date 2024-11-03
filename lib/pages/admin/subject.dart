import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitor_me/backend/classes.dart';
import 'package:monitor_me/components/card.dart';
import 'package:monitor_me/components/glass_container.dart';
import 'package:monitor_me/components/text_field.dart';
import 'package:monitor_me/pages/admin/subtopic.dart';
import 'package:monitor_me/pages/admin/topic.dart';
import 'package:monitor_me/pages/user/subject.dart';
import 'package:monitor_me/services/callback.dart';
import 'package:monitor_me/services/transitions.dart';
import 'package:provider/provider.dart';

class AdminSubjectPage extends StatefulWidget {
  const AdminSubjectPage({super.key});

  @override
  State<AdminSubjectPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<AdminSubjectPage> {
  List<Map<String,dynamic>> subjects = [
  ];

  @override
  Widget build(BuildContext context) {
    final headTeacher = Provider.of<HeadTeacherProvider>(context, listen: true).currentTeacher;
    subjects = headTeacher!.subjects!;
    
    return (headTeacher != null)? Scaffold(

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
              "Subjects",
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
                  "Welcome ${headTeacher.headTeacherInfo!['name']}",
                  style: GoogleFonts.bebasNeue(fontSize: 25),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Text(
                //   "Subjects",
                //   style: Theme.of(context).textTheme.titleMedium,
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    return SubjectCard(
                      title: subjects[index]["name"],
                      onPressed: () {
                        Navigator.push(
                            context,
                            slideLeftTransition(
                                AdminTopicPage(title: subjects[index]["name"])));
                      },
                      onLongPressed: () {
                        callDialog(
                          context: context,
                          title: "Delete Subject?",
                          content: const Text(
                              "Teachers associated to this subject will be unlinked!"),
                          onConfirm: () {
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    ):
    const Scaffold(
      body: Center(child: Text("head teacher is null"))
    );
  }
}

Widget subjectFAB(BuildContext context) {
  return GlassFloatingActionButton(
    icon: const Icon(Icons.add),
    label: const Text("Add Subject"),
    onPressed: () {
      // debugPrint("Hello");

      TextEditingController controller = TextEditingController();
      final formKey = GlobalKey<FormState>();

      String? form;

      callDialog(
          context: context,
          content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const SizedBox(height: 10),
                  FormTextField(
                    controller: controller,
                    hintText: "Subject name",
                    filled: true,
                    filledColor: Theme.of(context)
                        .colorScheme
                        .secondaryContainer
                       .withOpacity(0.2),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a subject name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Text(
                  //   "NB: You cannot delete this s once created",
                  //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  //       color: Theme.of(context).colorScheme.onErrorContainer,
                  //       fontWeight: FontWeight.bold),
                  // )
                ],
              )),
          title: "Add Subject?",
          onConfirm: () {
            if (formKey.currentState!.validate()) {
              debugPrint(controller.text);
              debugPrint(form);
            }
          });
    },
  );
}
