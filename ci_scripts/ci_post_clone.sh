#!/bin/sh

#  ci_post_clone.sh
#  Scripts-XcodeCloud
#
#  Created by Camilo Plaza on 01/11/23.

# Set the -e flag to stop running the script in case a command returns
# a nonzero exit code.
set -e

echo "🧩 Stage: Post-clone is activated .... "

brew install fastlane

if [ "$CI_WORKFLOW" = "CI" ]; then
	brew install swiftlint
	brew install sonar-scanner
	brew install jq
	brew install lizard-analyzer
fi

echo "🎯 Stage: Post-clone is done .... "
