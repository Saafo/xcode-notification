#!/usr/bin/env bash
# Author: @Saafo
# License: MIT License
# URL: https://github.com/Saafo/xcode-notification/blob/main/XcodeNotification.sh
# Notes: depends on envs: $IDEAlertMessage $XcodeDeveloperDirectory $XcodeWorkspace
XcodeName=${XcodeDeveloperDirectory#*Applications/}
XcodeName=${XcodeName%.app*}
Message=$IDEAlertMessage
Workspace=$XcodeWorkspace
Title="$Message | $XcodeName"
# time record
CacheDir="/tmp/XcodeNotification/timeCaches"
CacheFile="$CacheDir/$Workspace-$LaunchInstanceID"
Time=$(date +%s)
if [ "$Message" = "Build Started" ]; then
    mkdir -p $CacheDir
    echo $Time > $CacheFile
elif [ "$Message" = "Build Succeeded" ] ||
     [ "$Message" = "Build Failed" ]; then
    if [ -f $CacheFile ]; then
        Cost=$(($Time - $(<$CacheFile)))
        Content="$Workspace\nCost $Cost s"
    else
        Content="$Workspace"
    fi
    /usr/bin/osascript -e "display notification \"$Content\" with title \"$Title\""
    # sometimes build succeeded is triggered before build started, so we need to delay deleting the cache file
    sleep 1
    rm $CacheFile
elif [ "$Message" = "Run Started" ]; then
    /usr/bin/osascript -e "display notification \"$Workspace\" with title \"$Title\""
elif [ "$Message" = "Run Completed" ]; then
    echo
fi
#log
LogFile="$(cd $(dirname $0); pwd)/log.txt"
if [ ! -f $LogFile ]; then
    touch $LogFile
fi
echo "$Time $Workspace $Message" >> $LogFile
