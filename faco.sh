#include this function in your bash profile

faco () {

        branchList=$(git branch | grep -i $1 | tr '*' ' ');

        if [ -z "$branchList" ]; then

                echo No Match Found

                return;

        fi

        totalCount=$(echo "$branchList" | wc -l);

 

        echo Number of branches matched: $totalCount

        if [ $totalCount == 1 ]; then

                echo checking out branch

                git branch | grep $1 | xargs git checkout

                return;

        fi

 

        count=0;

        echo Multiple Mathces Found

        for line in $branchList

        do

                count=$((count+1));

                echo $count : $line

        done

 

        echo Which branch number do you want to checkout?

        read number;

        count=1;

        for line in $branchList

        do

                if [ $count = $number ]; then

                        echo " ";

                        git checkout $line

                        return;

                fi

                count=$((count+1));

        done

 

 

}

export -f faco
