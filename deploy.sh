if [ -z "$@" ]
then
    echo "Development"
    # build_project
    firebase use secondary-project-4e9d7
    firebase deploy --only functions
else
    if [ $@ == "--prod" ]
    then
        echo "Production"
        firebase use firstproject-ef6d3
        firebase deploy --only functions
        # build_project
    else
        echo "Invalid Script"
    fi
fi
exec bash
