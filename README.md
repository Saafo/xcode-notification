# xcode-notification

## Intro
Sometimes you may found Xcode.app **do not** exist in the notification auth list in the system preferences, 
even you make sure it does exist in the `~/Library/Preferences/com.apple.ncprefs.plist` file, 
and re-installed the Xcode.app, it still cannot get the notification auth, 
you may need this script to get the `Build Succeeded` notification from working again.

<img width="349" alt="image" src="https://user-images.githubusercontent.com/46736350/185845679-708b449b-46ef-45a9-8c10-db23ed33c956.png">

## Feature
* 🔔 Trigger an AppleScript based notification when build succeeded, build failed, and start running 
(other opportunities may also be available, based on the `Behavior` opportunities in Xcode preferences).
* ⏱ This script also contains the timing feature, recording the time interval between `Build Started` and `Build Succeeded` or `Build Failed`.
* 👨‍👩‍👧‍👦 Multi Xcode**s** supported.

## How to Use
1. Download the `XcodeNotifiacion.sh` into your local directory where you like.
2. Config `Build - Starts`, `Build - Succeeds`, `Build - Fails` (`Running - Starts` is optional) in the `Xcode - preferences - Behaviors`,
in the `Run` field, make sure these opportunities will execute the `XcodeNotification.sh` file directly or called in shell-chains.
