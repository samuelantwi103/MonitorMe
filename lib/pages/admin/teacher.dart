import 'package:flutter/material.dart';
import 'package:monitor_me/components/card.dart';
import 'package:monitor_me/components/glass_container.dart';
import 'package:monitor_me/components/text_field.dart';
import 'package:monitor_me/pages/user/home.dart';
import 'package:monitor_me/services/callback.dart';
import 'package:monitor_me/services/transitions.dart';

class AdminTeacherPage extends StatefulWidget {
  const AdminTeacherPage({
    super.key,
  });

  @override
  State<AdminTeacherPage> createState() => _UserTopicPageState();
}

class _UserTopicPageState extends State<AdminTeacherPage> {
  List<Map<String, dynamic>> subtopics = [
    {"name": "Prince Philips", "id": "101010", "contact": "0252356587"},
    {"name": "George Brown", "id": "202021", "contact": "0548659785"},
    {"name": "Marilyn Canty", "id": "201524", "contact": "0246958758"},
  ];

  @override
  Widget build(BuildContext context) {
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
              "Teachers",
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Text(
              //   "Subtopics",
              //   style: Theme.of(context).textTheme.titleMedium,
              // ),
              // const SizedBox(height: 10),
      
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: subtopics.length,
                itemBuilder: (context, index) {
                  var subtopic = subtopics[index];
                  return TeacherCard(
                    name: subtopic["name"],
                    id: subtopic["id"],
                    contact: subtopic["contact"],
                    onPressed: () {
                      Navigator.push(
                          context, scaleFadeTransition(const HomePage()));
                    },
                    onLongPressed: () {
                      callDialog(
                        context: context,
                        title: "Delete Teacher?",
                        content: const Text(
                            "Personal info and details will be permanently deleted!"),
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
            ],
          ),
        ),
      ),
    );
  }
}

Widget teacherFAB(BuildContext context) {
  return GlassFloatingActionButton(
    icon: const Icon(Icons.add),
    label: const Text("Add Teacher"),
    onPressed: () {
      // debugPrint("Hello");
      TextEditingController controller = TextEditingController();

      callDialog(
          context: context,
          content: Form(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormTextField(
                controller: controller,
                hintText: "Teacher's name",
                filled: true,
                filledColor: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.2),
              ),
              const SizedBox(height: 10),
            ],
          )),
          title: "Add Teacher?",
          onConfirm: () {
            debugPrint(controller.text);
          });
    },
  );
}
