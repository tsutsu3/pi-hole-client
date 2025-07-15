import 'dart:io';

/// Generates a Dart file containing the current Git commit hash.
///
/// This script runs the `git rev-parse --short HEAD` command to retrieve the short hash
/// of the latest commit. It then writes this hash to a Dart file at
/// `lib/build_info/git_commit.dart` as a constant string named `gitCommitHash`.
///
/// The generated file includes a warning comment indicating that it is auto-generated
/// and should not be edited manually.
///
/// Usage:
///   Run this script whenever you want to update the commit hash in your Dart project.
///   Typically, this is done as part of a build or release process.
///
/// Example output in `lib/build_info/git_commit.dart`:
///   // GENERATED FILE. DO NOT EDIT.
///   const String gitCommitHash = 'abc1234';
void main() async {
  final result = await Process.run('git', ['rev-parse', '--short', 'HEAD']);
  final commit = (result.stdout as String).trim();

  final content = '''
// GENERATED FILE. DO NOT EDIT.
const String gitCommitHash = '$commit';
''';

  File('lib/build_info/git_commit.dart').writeAsStringSync(content);

  stdout.writeln('Git commit hash generated: $commit');
}
