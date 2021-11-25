#!/bin/sh

#directory and copy them to DPATH directory

#Script Variables

flutter clean
flutter pub get

flutter build apk --release --target-platform android-arm,android-arm64,android-x64 --split-per-abi --no-tree-shake-icons

#!/bin/bash
filename='ChangeLog.txt'
n=1
textdata=''
  while read line; do
  # reading each line
  echo "Line No. $n : $line"
  textdata="$textdata \n $line"
  n=$((n+1))

done < $filename
echo "$textdata"

/usr/local/bin/firebase appdistribution:distribute build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk \
    --app 1:1074518178535:android:09b84453fa3091bb7c4042 \
    --release-notes "$textdata " \
    --groups "mobile-dev-mob"

echo "done"
