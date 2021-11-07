# !/bin/bash

firstly before executing any bash script run 
chmod +x exampleScript.sh
echo $?

$ : this i used with variables, command substitution, arethemetic substitution
\ : escape charater helps to remove "specialness" from a special character
# : comment
= : assignment
[] or [[]] : Test; evaluates for either true or false
! : negociation
>>,>,< : input/output direction
    example: ls -lR > directory-tree.txt
    echo myLabserver.com >> /etc/hosts
    sort < unsorted_list.txt
    cat < (echo "hey there")

| : pipe; sends the output of one command to the input of another(fileA 1->file B 0)
    example: cat /etc/passwd | grep rob

curl -o - http:/some.example.com/install.sh | bash #WRONG
bash < curl -o -http:/some.example.com/install.sh   #RIGHT

* or ? :Globs; ? is a wildcarc for a single character
---------------------------------------------------------------------------------------------

A string of command where the next command is only executed:
    with status zero &&
    with a non-zero status ||


STDIN, STDOUT, STDERR
0       1       2

STDIN 0
example: command < filename

STDOUT 1
example: command > filename

STDERR 2
example: command 2> error_file

STDOUT and STDERR 
example: command > file 2>&1

# Creating our own standard number with the script below

echo "abc 123" > file
exec 5<> file # meaning exec 5 is file and file is exec 5
read -n 3 var <&5  # passing the outputof exec 5 into var
echo $var
exec 5>&- # to not messe up your system if you don't remove exec 5
--------------------------------------------------------------------------------

sort: sort inputs and print out a sorted output
uniq: removes duplicate lines of data from the input stream
grep: searches incoming lines for matching text
fmt: Recives incoming text and outputs formatted text
tr: translates characters
head/tail: output the first/last few lines of a file
sed: stream editor; more powerful than tr as a character translator
awk: An entire programing languabe design for constructing filters. very powerful and complex
------------------------------------------------------------------------

# Working with arrays
    NUMBERS=(1 2 3 4 5 6)
    echo $NUMBERS
    echo ${NUMBERS[2]}
    echo ${NUMBERS[@]}

    NUMBERS=(1 2 3 four 5 six seven "this is eight")
    NUMBERS+=(9)
    echo ${NUMBERS[@]:2:5}
    echo ${NUMBERS[@]:2}

# Working with for loop
    for i in $(ls); do
        echo item: $i
    done

    for i in $(seq 1 10); do
        echo $i
    done

    for i in $(seq 1 10); do touch files$i; done

# working with the while loop
    COUNTER=20
    until [$COUNTER -lt 10]; do 
        echo The counter is $COUNTER
        let COUNTER-=1 # or ((COUNTER--))
    done

# WORKING WITH SIGNALS AND TRAPS
    # SIGINT, SIGKILL, SIGTERM, SIGUSR1

    ctrlc=0

    function trap_ctrlc {
        let ctrlc++
        echo
        if [[$ctrlc == 1]]; then
            echo "I warned you..."
        elif [[$ctrlc==2]]; then
            echo "Throwing in the towel"
            exit
        fi
    }

    trap trap_ctrlc SIGINT

    while true
    do
        echo Sleeping...
        sleep 10
    done


# Dealing with Tests, Exit Status and Builtins

    if [ $VAR1 -eq $VAR2 ]
    then
        command1
    else
        command2
    fi


# Working with DELIMITER
#this output the value of the variable and also keeps the position of the tabs
cat << DELIMETER 
stuff goes here
can even include $(variables)
that will be substituted as normal
    or tabs if needed.
DELIMETER

# We first cat << into ca before cat > newfile 
cat > Newfile << DELIMETER  
stuff goes here
can even include $(variables)
that will be substituted as normal
    or tabs if needed.
DELIMETER

#this does not output the value of the variable
cat << "DELIMETER"
stuff goes here
can even include $(variables)
that will be substituted as normal
    or tabs if needed.
DELIMETER

#this output the value of the variable but does not keep the position of the tabs
cat <<- "DELIMETER"
stuff goes here
can even include $(variables)
that will be substituted as normal
    or tabs if needed.
DELIMETER

#WORKING WITH HERESTRIN
    command <<< "$WORD"
    # example 1:
        if grep -q "txt" <<< "$VAR"
        then
            echo "$VAR contains the substring sequence \"txt\""
        else
            echo "Nope, didn't find it"
        fi
    # example 2:
        STRING="This is a string of words in a variable"
        read -r -a Words <<< $STRING # Words here is like a placeholder for every element entering. Just like "i" 

        echo "First word is ${Word[0]}"
        echo "Second word is ${Word[1]}"
        echo "Third word is ${Word[2]}"
        echo "Fourt word is ${Word[3]}"
    # example 3:
        ARRAY=(e1 e2 e3 {A..F})

        while read element; do  # elements here is like a placeholder for every element entering. Just like "i" 
            echo $element
            echo "herestrings are fun"
        done <<< $(echo ${ARRAY[*]})
# WORKING WITH SET
    set -x #explicitly shows you the way things are being processed
    set -u # just shows where the last line that ran stoped
    