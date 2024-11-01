// ../../washking/washking/lib/components/card.dart
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:monitor_me/components/button.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      // constraints: BoxConstraints(minHeight: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(
          //   color: Theme.of(context).colorScheme.surfaceContainer
          // ),

          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              blurRadius: 5,
              spreadRadius: 5,
              offset: const Offset(-3, -3),
            ),
            BoxShadow(
              color: Theme.of(context)
                  .colorScheme
                  .surfaceContainer
                  .withOpacity(0.8),
              blurRadius: 5,
              spreadRadius: 5,
              offset: const Offset(5, 5),
            ),
          ]),
      child: child,
    );
  }
}

class QuizAnnouncementCard extends StatelessWidget {
  final String title;
  final String subject;
  final String duration;
  final String dueDate;
  final void Function() onTap;

  const QuizAnnouncementCard({
    super.key,
    required this.title,
    required this.subject,
    required this.duration,
    required this.dueDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomCard(
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Subject: $subject")),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("TIme Allowed: $duration")),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Due date: $dueDate")),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: OutlinedCustomButton(text: "Start", onPressed: onTap)),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class ResultAnnouncementCard extends StatelessWidget {
  final String title;
  final String subject;
  final double score;
  // String duration;
  // String dueDate;
  final void Function() onTap;

  const ResultAnnouncementCard({
    super.key,
    required this.title,
    required this.subject,
    required this.score,
    // required this.duration,
    // required this.dueDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomCard(
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Subject: $subject")),
            Align(
                alignment: Alignment.centerLeft, child: Text("Score: $score%")),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedCustomButton(
                onPressed: () {},
                text: "View",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class AssessmentCard extends StatelessWidget {
  final String title;
  final String subject;
  final String duration;
  final double? score;
  final String dueDate;
  final void Function() onViewScore;
  final void Function() onStart;

  const AssessmentCard({
    super.key,
    required this.title,
    required this.subject,
    required this.duration,
    required this.score,
    required this.dueDate,
    required this.onViewScore,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(
      //   minHeight: 200,
      // height: 400,
      height: Breakpoints.mediumAndUp.isActive(context) ? 330 : 400,
      //   maxWidth: 500,
      // ),
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomCard(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subject,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Due: $dueDate",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            // color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                duration,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      // color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Breakpoints.mediumAndUp.isActive(context)
                ? Row(children: [
                    Expanded(
                      child: FullOutlineButton(
                          onPressed: onViewScore,
                          text: "View Score",
                          enabled: score == null ? true : false),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FullButton(
                          onPressed: onStart,
                          text: "Start Quiz",
                          enabled: score == null ? false : true),
                    ),
                  ])
                // ? Row(children: [
                //     Expanded(
                //       child: FullOutlineButton(
                //         onPressed: onViewScore,
                //         text: "View Score",
                //       ),
                //     ),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Expanded(
                //       child: FullButton(
                //         onPressed: onStart,
                //         text: "Start Quiz",
                //       ),
                //     ),
                //   ])
                : Column(children: [
                    FullOutlineButton(
                        onPressed: onViewScore,
                        text: "View Score",
                        enabled: score == null ? true : false),
                    const SizedBox(
                      height: 10,
                    ),
                    FullButton(
                        onPressed: onStart,
                        text: "Start Quiz",
                        enabled: score == null ? false : true),
                  ]),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class MockCard extends StatelessWidget {
  final String title;
  final String subject;
  final String duration;
  final double? score;
  final String dueDate;
  final void Function() onViewScore;
  final void Function() onStart;

  const MockCard({
    super.key,
    required this.title,
    required this.subject,
    required this.duration,
    required this.score,
    required this.dueDate,
    required this.onViewScore,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(
      //   minHeight: 200,
      // height: 400,
      height: Breakpoints.mediumAndUp.isActive(context) ? 330 : 400,
      //   maxWidth: 500,
      // ),
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomCard(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subject,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Due: $dueDate",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            // color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                duration,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      // color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Breakpoints.mediumAndUp.isActive(context)
                ? Row(children: [
                    Expanded(
                      child: FullOutlineButton(
                          onPressed: onViewScore,
                          text: "View Score",
                          enabled: score == null ? true : false),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FullButton(
                          onPressed: onStart,
                          text: "Start Exam",
                          enabled: score == null ? false : true),
                    ),
                  ])
                // ? Row(children: [
                //     Expanded(
                //       child: FullOutlineButton(
                //         onPressed: onViewScore,
                //         text: "View Score",
                //       ),
                //     ),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Expanded(
                //       child: FullButton(
                //         onPressed: onStart,
                //         text: "Start Quiz",
                //       ),
                //     ),
                //   ])
                : Column(children: [
                    FullOutlineButton(
                        onPressed: onViewScore,
                        text: "View Score",
                        enabled: score == null ? true : false),
                    const SizedBox(
                      height: 10,
                    ),
                    FullButton(
                        onPressed: onStart,
                        text: "Start Exam",
                        enabled: score == null ? false : true),
                  ]),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class TopicTile extends StatelessWidget {
  final String title;
  final int total;
  final int completed;

  final VoidCallback onTap;

  const TopicTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    // debugPrint("option: $option correct: $isCorrect");
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        // height: 50,

        width: double.maxFinite,
        child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            horizontalTitleGap: 5,
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text("$completed/$total"),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  value: completed / total,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 7,
                ),
              ),
            )),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const SubjectCard({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              width: 2, color: Theme.of(context).colorScheme.secondary)),
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      child: Container(
        // padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 2, color: Theme.of(context).colorScheme.secondary)),
        constraints: const BoxConstraints(
          maxWidth: 300,
        ),
        child: ListTile(
          title: Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          trailing: IconButton.filledTonal(
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_forward_ios_rounded)),
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
