import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitor_me/components/card.dart';
import 'package:monitor_me/components/collapsible.dart';
import 'package:monitor_me/components/glass_container.dart';
import 'package:monitor_me/pages/user/topic.dart';
import 'package:monitor_me/services/transitions.dart';

class UserSubjectPage extends StatefulWidget {
  final String title;
  const UserSubjectPage({super.key, required this.title});

  @override
  State<UserSubjectPage> createState() => _UserSubjectPageState();
}

class _UserSubjectPageState extends State<UserSubjectPage> {
  @override
  Widget build(BuildContext context) {
    List<List<Map<String,dynamic>>> topics = [
      // Form 1
     [ {
        "title": "Introduction to Physics",
        "completed": 7,
        "total": 10,
      },
      {
        "title": "Vectors",
        "completed": 0,
        "total": 15,
      }],
      // Form 2
     [ {
        "title": "Introduction to Physics",
        "completed": 7,
        "total": 10,
      },
      {
        "title": "Vectors",
        "completed": 0,
        "total": 15,
      }],
      // Form 3
     [ {
        "title": "Introduction to Physics",
        "completed": 7,
        "total": 10,
      },
      {
        "title": "Vectors",
        "completed": 0,
        "total": 15,
      }],
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:const Size(double.maxFinite, 60),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // const Text("Hello Prince 😁"),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, form) {
                var  formdata = topics[form];
                  // For each form
                  return CollapsibleTile(
                    header: Text("Form ${form + 1}"),
                    content: [
                      Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainer),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: formdata.length,
                            itemBuilder: (context, topic) {
                              var topicData = formdata[topic];
                              return TopicTile(
                              title: topicData["title"] ,
                              completed: topicData["completed"] ,
                              total: topicData["total"] ,
                              onTap: () {
                                debugPrint("Hello");
                                Navigator.push(context,
                                    slideLeftTransition(UserTopicPage(
                                     title: topicData["title"]
                                    )));
                              },
                            );},
                            separatorBuilder: (context, index) => const Divider(
                                // indent: 25,
                                // endIndent: 25,
                                ),
                          ))
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
              ),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
