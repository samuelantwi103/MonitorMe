import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitor_me/components/card.dart';
import 'package:monitor_me/components/collapsible.dart';
import 'package:monitor_me/components/glass_container.dart';
import 'package:monitor_me/pages/user/dashboard.dart';
import 'package:monitor_me/pages/user/subject.dart';
import 'package:monitor_me/services/transitions.dart';

class UserTopicPage extends StatefulWidget {
  final String title;
  const UserTopicPage({
    super.key,
    required this.title,
  });

  @override
  State<UserTopicPage> createState() => _UserTopicPageState();
}

class _UserTopicPageState extends State<UserTopicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
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
              "Introduction to Physics",
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
              const Text("Subtopics "),
              const SizedBox(height: 10),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Measurements"),
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
