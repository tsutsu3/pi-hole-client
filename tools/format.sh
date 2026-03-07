#!/bin/bash
# Format all Dart files, excluding generated files.
# Usage: ./tools/format.sh [dart format options]
set -e

find lib test testing \
  -name "*.dart" \
  ! -path "*/generated/*" \
  ! -name "*.g.dart" \
  ! -name "*.freezed.dart" \
  ! -name "*.mocks.dart" \
  | xargs -n 50 dart format "$@"
