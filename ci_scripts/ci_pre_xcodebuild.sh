#!/bin/sh

#  ci_pre_xcodebuild.sh
#  Scripts-XcodeCloud
#
#  Created by Camilo Plaza on 01/11/23.

# Set the -e flag to stop running the script in case a command returns
# a nonzero exit code.
set -e

echo "🧩 Stage: PRE-Xcode Build is activated .... "

if [ "$CI_WORKFLOW" = "CI" ]; then
    if which swiftlint >/dev/null; then
        ./swiftlint/run_swiftlint.sh
    fi
fi

echo "🎯 Stage: PRE-Xcode Build is DONE .... "
