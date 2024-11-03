// ../../washking/washking/lib/components/dialog.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitor_me/components/button.dart';
import 'package:monitor_me/components/glass_container.dart';

class PopupDialog extends StatelessWidget {
  final String title;
  final Widget message;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final bool showTitle;
  final bool showCancel;
  final bool showConfirm;

  const PopupDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onCancel,
    required this.onConfirm,
    required this.showTitle,
    required this.showCancel,
    required this.showConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: GlassContainer(
        constraints: const BoxConstraints(
          maxWidth: 400,
          maxHeight: 600,
        ),
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.7),
              // Theme.of(context).colorScheme.secondaryContainer.withAlpha(150),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              showTitle
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: GoogleFonts.bebasNeue(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 20,
                          letterSpacing: 5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 10),
              message,
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: Wrap(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    showCancel
                        ? TextButton(
                            onPressed: onCancel,
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onErrorContainer),
                            ),
                          )
                        : const SizedBox(),
                    showConfirm
                        ? SmoothButton(
                            onPressed: onConfirm,
                            text: 'Confirm',
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // title: showTitle ? Text(title) : null,
      // content: message,
      // elevation: 10,
      // backgroundColor:
      //                 Theme.of(context).colorScheme.primary.withOpacity(0.2),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(12),
      // ),
      // actions: !showCancel && !showConfirm

      //     ? null:<Widget>[
      //         showCancel
      //             ? TextButton(
      //                 onPressed: onCancel,
      //                 child: const Text('Cancel'),
      //               )
      //             : const SizedBox(),
      //        showCancel
      //             ?  SmoothButton(
      //           onPressed: onConfirm,
      //           text: 'Confirm',
      //         ):const SizedBox(),
      //       ]
      //     ,
    );
  }
}

class CustomBottomSheet extends StatefulWidget {
  final String title;
  final Widget content;
  final String? actionText;
  final VoidCallback? onAction;
  final ScrollController scrollController;
  final bool full;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.content,
    required this.actionText,
    required this.onAction,
    required this.scrollController,
    required this.full,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    if (widget.actionText != null) {
      return GlassContainer(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            widget.content,
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: widget.onAction,
                child: Text(widget.actionText!),
              ),
            ),
          ],
        ),
      );
    } else {
      return GlassContainer(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(child: widget.content),
            const SizedBox(height: 20),
          ],
        ),
      );
    }
  }
}
