#!/bin/sh

#  run_swiftlint.sh
#  XcodeCloud-Scripts
#
#  Created by KeimyPlaza on 01/11/23.

# Set the -e flag to stop running the script in case a command returns
# a nonzero exit code.
set -e

echo "🧩 Stage: Swiftlint is activated .... "

swiftlint --fix "$CI_PRIMARY_REPOSITORY_PATH" --config "$CI_PRIMARY_REPOSITORY_PATH/.swiftlint.yml"

echo "🎯 Stage: Swiftlint is done .... "