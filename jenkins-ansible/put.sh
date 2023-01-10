#!/bin/bash

counter=0
sql="INSERT INTO register VALUES"
while [ $counter -lt 50 ]; do
    let counter=counter+1
    full_name=$(nl people.txt | grep -w $counter | awk '{print $2}')    # extra the full name based-on the line number of using nl
    name=$(awk -F ',' '{print $1}' <<< "$full_name")    # pass variable to awk
    lastname=$(echo $full_name | awk -F ',' '{print $2}')   # pass a string to awk
    # age=$(jot -r 1 20 30)   # MACOS: generate a random age from 20 to 30 inclusively
    age=$(shuf -i 20-30 -n 1)   # UBUNTU: generate a random age from 20 to 30 inclusively
    if [ $counter != 1 ]; then
        sql+=","
    fi
    sql+="($counter, '$name', '$lastname', $age)"
done

mysql -u root -p1234 people -e "$sql"
echo "The data have been imported successfully"
