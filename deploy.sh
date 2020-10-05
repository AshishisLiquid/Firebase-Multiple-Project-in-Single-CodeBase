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
    firebase deploy --only functions:$result
}
productionFunctions(){
    mainstring=$1
    result=""
    if [[ $mainstring == *"--prod"* ]]; then
        newstr=${mainstring#*:}
        result=$newstr
    fi
    firebase deploy --only functions:$result
}
str=$@ 
if [ -z "$str" ]; then
    echo "Development without functions"
    firebase use secondary-project-4e9d7
else
    if [[ $str == *":"* ]] && [[ $str != *"--prod"* ]]; then
        echo "Development with functions"
        firebase use secondary-project-4e9d7
        deploymentFunctions $str
    elif [[ $str == *":"* ]] && [[ $str == *"--prod"* ]]; then
        echo "Production with functions"
        firebase use firstproject-ef6d3
        productionFunctions $str
    elif [[ $str != *":"* ]] && [[ $str == *"--prod"* ]]; then
        echo "Production without Functions"
        firebase use firstproject-ef6d3
    else
        echo "Invalid Script"
    fi
fi
