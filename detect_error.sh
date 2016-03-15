EXIT_CODE=0

while read readline
do
	echo $readline
	if [[ "$readline" == "Error: "* ]]
	then
		EXIT_CODE=1
	fi
done

exit $EXIT_CODE
