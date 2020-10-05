#deployment batch script
# dev_config="C:\Users\Ashish\Desktop\tryproject\dev-config.json"
# prod_config = "C:\Users\Ashish\Desktop\tryproject\dev-config.json"
# build_project(){
#     cd "app"
#     ng build
#     cd ..
# }
deploymentFunctions(){
    mainstring=${1#*:}
    result=""
    testKeyWord="Test"
    if [[ $mainstring == *","* ]]; then
        find=","
        replace="Test,"
        result="${mainstring//$find/$replace}$testKeyWord"
    else
        result="$mainstring$testKeyWord"
    fi
    echo $result
    # firebase deploy --only functions:$result
}
checkFunctions(){
    mainstring=$1
    result=""
    if [[ $mainstring == *"--prod"* ]]; then
        newstr=${mainstring#*:}
        result=$newstr
    fi
    echo $result
    # firebase deploy --only functions:$result
}
str=$@ 
if [ -z "$str" ]; then
    echo "Development without functions"
    # build_project
    firebase use secondary-project-4e9d7
else
    if [[ $str == *":"* ]] && [[ $str != *"--prod"* ]]; then
        echo "Development with functions"
        firebase use secondary-project-4e9d7
        deploymentFunctions $str
    elif [[ $str == *":"* ]] && [[ $str == *"--prod"* ]]; then
        echo "Production with functions"
        firebase use firstproject-ef6d3
        checkFunctions $str
    elif [[ $str != *":"* ]] && [[ $str == *"--prod"* ]]; then
        echo "Production without Functions"
        firebase use firstproject-ef6d3
    else
        echo "Invalid Script"
    fi
fi
# exec bash
# printf "%s\n" $GOOGLE_APPLICATION_CREDENTIALS
# printf "%s\n" $SCRIPTPATH
# export GOOGLE_APPLICATION_CREDENTIALS=$SCRIPTPATH
# printf "%s\n" $ASHISH
