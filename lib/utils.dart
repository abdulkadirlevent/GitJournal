import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import 'package:flushbar/flushbar.dart';

import 'app.dart';
import 'core/note.dart';
import 'state_container.dart';

Future<String> getVersionString() async {
  var info = await PackageInfo.fromPlatform();
  var versionText = "";
  if (info != null) {
    versionText = info.appName + " " + info.version + "+" + info.buildNumber;

    if (JournalApp.isInDebugMode) {
      versionText += " (Debug)";
    }
  }

  return versionText;
}

void showUndoDeleteSnackbar(
  BuildContext context,
  StateContainerState stateContainer,
  Note deletedNote,
  int deletedNoteIndex,
) {
  var theme = Theme.of(context);

  Flushbar(
    message: "Note Deleted",
    duration: const Duration(seconds: 3),
    mainButton: FlatButton(
      child: Text(
        "Undo",
        style: TextStyle(color: theme.accentColor),
      ),
      onPressed: () {
        Fimber.d("Undoing delete");
        stateContainer.undoRemoveNote(deletedNote, deletedNoteIndex);
      },
    ),
  ).show(context);
}

void showSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    duration: const Duration(seconds: 3),
  ).show(context);
}
