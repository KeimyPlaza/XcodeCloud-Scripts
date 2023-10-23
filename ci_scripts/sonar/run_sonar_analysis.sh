#!/bin/sh

#  run_sonar_analysis.sh
#  Script-XcodeCloud
#
#  Created by Camilo Plaza on 01/11/23.

# Set the -e flag to stop running the script in case a command returns
# a nonzero exit code.
set -e

echo "🧩 Stage: SonarQube is activated .... "

(cd $CI_PRIMARY_REPOSITORY_PATH && fastlane app_lizard_analysis \
  workspace:"$CI_PRIMARY_REPOSITORY_PATH")

(cd $CI_PRIMARY_REPOSITORY_PATH && fastlane app_sonar_analysis \
  result_path:$CI_RESULT_BUNDLE_PATH \
  workspace:"$CI_PRIMARY_REPOSITORY_PATH" \
  sonar_token:"$SONARQUBE_GENERAL_TOKEN_OR_APP_TOKEN" \
  scheme:"$CI_XCODE_SCHEME")

echo "🎯 Stage: SonarQube is done .... "