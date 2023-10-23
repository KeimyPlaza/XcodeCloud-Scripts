#!/bin/sh

#  run_archive_actions.sh
#  Scripts-XcodeCloud
#
#  Created by Camilo Plaza on 01/11/23.

# Set the -e flag to stop running the script in case a command returns
# a nonzero exit code.
set -e

echo "🧩 Stage: Archive actions is activated .... "

(cd $CI_PRIMARY_REPOSITORY_PATH && fastlane app_archive_post_actions \
  scheme:$CI_XCODE_SCHEME \
  new_build_number:"$CI_BUILD_NUMBER")

echo "🎯 Stage: Archive actions is done .... "
