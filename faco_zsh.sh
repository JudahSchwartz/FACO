faco () {

        branchList=$(git branch | grep -i $1 | tr '*' ' ' | tr -d ' ');

        if [ -z "$branchList" ]; then

                echo No Match Found

                return;

        fi

        totalCount=$(echo "$branchList" | wc -l | tr -d ' ');


        echo Number of branches matched: $totalCount

        if [ $totalCount = 1 ]; then

                echo checking out branch

                git branch | grep $1 | tr -d '*' | xargs git checkout

                return;

        fi

 

        count=0;

        echo Multiple Matches Found

        echo "$branchList" | while IFS= read -r line ;

        do

                count=$((count+1));

                echo "${count} : ${line}"

        done

 

        echo 'Which branch number do you want to checkout?'

        read number;

        count=1;

        echo "$branchList" | while IFS= read -r line ;

        do

                if [ $count = $number ]; then

                        echo " ";

                        git checkout $line

                        return;

                fi

                count=$((count+1));

        done

}

