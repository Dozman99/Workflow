#!/bin/bash

# SCRIPT 1
    # Backing up required files
    LOGFILE=$1 # Script function from discription on func tail
    BACKUP_LOC="/usr/bin/*"
    BACKUP_TARGET="/home/$USER/backup"
    init () {
        echo "Creating backup directory" && mkdir $BACKUP_TARGET > $LOGFILE 2>&1 || echo" Directory already exist"
        echo "" > $LOGFILE #to empty the logfile
        local CLOUDGURU=37 #showing variables inside a function
        echo "$(date +"%x %r %Z")" >> $LOGFILE #Using cron task for it
    }
    # this will prevent us from writing "tail =n" rather "tail"
    tail (){
        command tail -n $1 ? #Function varriable
    }
    init
    echo "Coping Files" && cp -v $BACKUP_LOC $BACKUP_TARGET > $LOGFILE 2>&1

    grep -i denied $LOGFILE | tail 2 #function tail is called here

    exit 127

# SCRIPT 2
    DATETIME=$(date +"%D+%T")
    LOGDIR= "/home/$USER/$LOGFILE"
    BACKUP_TARGET="/home/$USER/work_backup"
    BACKUP_SOURCE="/home/$USER/work/*"


    echo "TImestamp before work is done $DATETIME" >> $LOGDIR
    echo "Creating backup directory" >> $LOGDIR
    mkdir $BACKUP_TARGET
    sleep 3
    echo "Coping Files" >> $LOGDIR
    cp -v $BACKUP_SOURCE $BACKUP_TARGET >> $LOGDIR
    echo "Finished Coping Files" >> $LOGDIR
    echo "Timestamp after work is done $DATETIME" >> $LOGDIR
    echo $DATETIME >> $LOGDIR


# SCRIPT 2 UPDATE


    LOGDIR= "/home/$USER/$LOGFILE"
    BACKUP_TARGET="/home/$USER/work_backup"
    BACKUP_SOURCE="/home/$USER/work/*"

IF  [ -z "$1" ]; then
        echo "you have failed to pass a parameter. Please ty again."
        exit 255;

function ctrlc {
    rm -rf $BACKUP_TARGET
    rm -f $LOGDIR
    echo "Recived Ctrl+C"
    exit 255
}

trap ctrlc SIGINT

    echo "TImestamp before work is done $(date +"%D %T")" >> $LOGDIR
    echo "Creating backup directory" >> $LOGDIR
    mkdir $BACKUP_TARGET
    sleep 3
    echo "Coping Files" >> $LOGDIR
    cp -v $BACKUP_SOURCE $BACKUP_TARGET >> $LOGDIR
    echo "Finished Coping Files" >> $LOGDIR
    echo "Timestamp after work is done $(date +"%D %T")" >> $LOGDIR
    echo $(date +"%D %T") >> $LOGDIR #datetime can't be associated with a varriable. because it would only output the time of when it was first initialized
    sleep 15 # this is just to slow down the script
# SCRIPT 3
    LOGFILE=$1 # to identify the flag after passsing the script
    BACKUP_TARGET="/home/$USER/work_backup"
    BACKUP_LOC="/usr/bin/*"
    init () {
        echo "Creating backup directory" && mkdir $BACKUP_TARGET > $LOGFILE 2>&1 || echo" Directory already exist"
        echo "$(date +"%x %r %Z")" >> $LOGFILE #Using cron task for it
    }
    # this will prevent us from writing "tail =n" rather "tail"
    tail (){
        command tail -n $1 ? # flag is demo here
    }
    init
    echo "Coping Files"
    cd $BACKUP_LOC
    for i in $(ls); do
        cp -v "$i" $BACKUP_TARGET/"$1"-backup >> $LOGFILE 2>&1
    done

    grep -i denied $LOGFILE | tail 2 #function tail is called here
    exit 127


# SCRIPT 4
    if [ -z $1] # Making sure that $1 is not empty
    then 
        echo "You need to supplu a parameter for the logfile."
        exit 255
    fi


        LOGFILE=$1 # to identify the flag after passsing the script
        LOGDIR= "/home/$USER/$LOGFILE"
        BACKUP_TARGET="/home/$USER/work_backup"
        BACKUP_LOC="/usr/bin/*"
        
    init () {
        if [ -d $BACKUP_TARGET ]
            then
                echo "Directory already exists."
                echo "$(date +"%x %r %Z")" >> $LOGFILE #Using cron task for it
                return 1
            else
                mkdir $BACKUP_TARGET
                echo "$(date +"%x %r %Z")" >> $LOGFILE #Using cron task for it
                return 0
        fi
    }

    tail () {
            command tail -n $1  # flag is demo here
    }

    cleanup() {
        rm -rf $BACKUP_TARGET
        echo "RECIVED CTRLC" >> $LOGDIR
        exit
    }
    trap cleanup SIGINT  # When you ctrl-c, it calls the function cleanup

    if (init) # note that the it is in () and not [] since we are refering to a condition being met within the script
        then # condition holds when return status is 0
            echo "Directory did not exist."
        else # condition holds when return status is NOT 0
            echo "Directory did exist"
    fi

    echo "Coping Files"
    cd $BACKUP_LOC
    for i in $(ls); do
        cp -v "$i" $BACKUP_TARGET/"$1"-backup >> $LOGFILE 2>&1
    done

    grep -i denied $LOGFILE | tail 2 #function tail is called here
    exit 127
