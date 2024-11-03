import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitor_me/components/card.dart';
import 'package:monitor_me/components/glass_container.dart';
import 'package:monitor_me/components/text_field.dart';
import 'package:monitor_me/services/callback.dart';

class AdminSubtopicPage extends StatefulWidget {
  final String title;
  const AdminSubtopicPage({
    super.key,
    required this.title,
  });

  @override
  State<AdminSubtopicPage> createState() => _AdminSubtopicPageState();
}

class _AdminSubtopicPageState extends State<AdminSubtopicPage> {
  List<Map<String, dynamic>> subtopics = [
    {
      "title": "Units of measurements",
      "complete": true,
    },
    {
      "title": "Dimensional analysis",
      "complete": false,
    },
    {
      "title": "Physical quantities",
      "complete": true,
    },
    {
      "title": "Dimensional analysis",
      "complete": false,
    },
    {
      "title": "Physical quantities",
      "complete": true,
    },
    {
      "title": "Scientific notations and units of measurement",
      "complete": false,
    },
    {
      "title": "Physical quantities",
      "complete": true,
    },
    {
      "title": "Dimensional analysis",
      "complete": false,
    },
    {
      "title": "Physical quantities",
      "complete": true,
    },
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
              widget.title,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            leading: const CupertinoNavigationBarBackButton(),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Subtopics",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Card(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subtopics.length,
                    itemBuilder: (context, index) {
                      var subtopic = subtopics[index];
                      return SubtopicTile(
                        title: subtopic["title"],
                        isComplete: subtopic["complete"],
                        onTap: (bool? value) {
                          setState(() {
                            subtopic["complete"] = value ?? false;
                          });
                        },
                        onLongPress: () {
                          // debugPrint("Hello");
                          callDialog(
                              context: context,
                              title: "Delete Subtopic?",
                              content: const Text(
                                  "All data associated with this subtopic will be lost!"),
                              onConfirm: () {
                                Navigator.pop(context);
                              });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                      child: Divider(
                        thickness: 3,
                      ),
                    ),
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
      floatingActionButton: GlassFloatingActionButton(
        icon: const Icon(Icons.add),
        label: const Text("Add Subtopic"),
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
                    hintText: "Subtopic name",
                    filled: true,
                    filledColor: Theme.of(context)
                        .colorScheme
                        .secondaryContainer
                        .withOpacity(0.2),
                  ),
                ],
              )),
              title: "Add Subtopic?",
              onConfirm: () {
                debugPrint(controller.text);
              });
        },
      ),
    );
  }
}
