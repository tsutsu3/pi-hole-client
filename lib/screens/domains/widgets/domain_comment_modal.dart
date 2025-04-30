// import 'package:flutter/material.dart';
// import 'package:pi_hole_client/l10n/generated/app_localizations.dart';

// class DomainCommentModal extends StatelessWidget {
//   const DomainCommentModal({required this.comment, super.key});

//   final String comment;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       scrollable: true,
//       title: Column(
//         children: [
//           Icon(
//             Icons.comment_rounded,
//             size: 24,
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Text(
//               AppLocalizations.of(context)!.comment,
//               style: const TextStyle(fontSize: 24),
//             ),
//           ),
//         ],
//       ),
//       content: Text(
//         comment,
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.maybePop(context),
//           child: Text(AppLocalizations.of(context)!.close),
//         ),
//       ],
//     );
//   }
// }
