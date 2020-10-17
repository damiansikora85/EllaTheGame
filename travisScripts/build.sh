#! /bin/sh

PROJECT_PATH=$(pwd)/Ella-the-game
UNITY_BUILD_DIR=$(pwd)/Build
LOG_FILE=$UNITY_BUILD_DIR/unity-win.log


ERROR_CODE=0
echo "Items in project path ($PROJECT_PATH):"
ls "$PROJECT_PATH"


#echo "Building project for Windows..."
mkdir $UNITY_BUILD_DIR
#/Applications/Unity/Unity.app/Contents/MacOS/Unity \
 # -batchmode \
 # -nographics \
 # -silent-crashes \
 # -logFile \
 # -projectPath "$PROJECT_PATH" \
 # -buildWindows64Player  "$(pwd)/build/win/game_win.exe" \
 # -quit \
 # | tee "$LOG_FILE"


echo "Building project for Osx..."
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
	-batchmode \
	-nographics \
	-silent-crashes \
	-logFile $(pwd)/unity.log \
	-projectPath "$PROJECT_PATH" \
	-buildOSXUniversalPlayer "$(pwd)/Build/osx/game_osx.app" \
	-quit \
  | tee "$LOG_FILE"


  
if [ $? = 0 ] ; then
  echo "Building completed successfully."
  ls "$PROJECT_PATH"
  ERROR_CODE=0
else
  echo "Building failed. Exited with $?."
  ERROR_CODE=1
fi

echo "Build logs (OSX)"
cat $(pwd)/unity.log

echo "Finishing with code $ERROR_CODE"
exit $ERROR_CODE