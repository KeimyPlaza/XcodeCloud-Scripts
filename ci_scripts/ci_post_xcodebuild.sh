#!/bin/sh

#  ci_post_xcodebuild.sh
#  Scripst-XcodeCloud
#
#  Created by Camilo Plaza on 01/11/23.

# Set the -e flag to stop running the script in case a command returns
# a nonzero exit code.
set -e

echo "🧩 Stage: POST-Xcode Build is activated .... "

if [ "$CI_WORKFLOW" = "CI" ]; then
  if which fastlane >/dev/null; then
    rm -rf $CI_RESULT_BUNDLE_PATH

    xcodebuild \
      -project "$CI_PRIMARY_REPOSITORY_PATH/$CI_XCODE_PROJECT" \
      -scheme "$SCHEME_UNIT_TESTING" \
      -destination 'platform=iOS Simulator,name=iPhone 15' \
      -enableCodeCoverage YES \
      -resultBundlePath $CI_RESULT_BUNDLE_PATH \
      test-without-building

    ./sonar/run_sonar_analysis.sh
  fi
elif [ "$CI_WORKFLOW" = "CD" ]; then
    if [[ -d "$CI_APP_STORE_SIGNED_APP_PATH" ]]; then

      # Release Notes (automatic base on 3rd last commits)
      TESTFLIGHT_DIR_PATH=$CI_PRIMARY_REPOSITORY_PATH/TestFlight
      mkdir -p $TESTFLIGHT_DIR_PATH
      git fetch --deepen 3 && git log -3 --oneline > "$TESTFLIGHT_DIR_PATH/WhatToTest.es_ES.txt"

      if which fastlane >/dev/null; then
        ./testflight/run_archive_actions.sh

        git push origin $CI_BRANCH --tags
      fi
    fi
fi

echo "🎯 Stage: POST-Xcode Build is DONE .... "
