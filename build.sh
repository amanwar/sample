git stash
if [[ $1 ]]; then
	#statements
fi
git checkout $1
xcodebuild -sdk iphonesimulator8.0
retval=$?
if [ "$retval" == 0 ]
then
	echo "Successfully built project";
	xcodebuild test -scheme SnakesAndLadders -destination 'platform=iOS Simulator,name=iPhone 5s'
	retval=$?
	if [ "$retval" == 0 ]
	then
		echo "All unit-tests passed...";
		# if [last_command_result() = "Success"] then
		# 	echo "Automation testcases passed...";
		# else
		# 	echo "Automation testcases failed. Exiting...";
		# fi
	else
		echo "Some unit-tests failed. Exiting...";
	fi
else
	echo "Failed to built project. Exiting...";
fi

# last_command_result() {
# 	if test $? -eq 0; then 
# 		return "Success";
# 	else
# 		return "Failed";
# 	fi
# }