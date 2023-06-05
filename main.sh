
copy () {
    itter=$3
    current_time=`date +%H:%M`
    current_day=`date +%m.%d.%Y`
    
    printf "%04d" "$itter"
    printf "%s\n" " >   ${current_day} ${current_time} >  backup of $2"

    rm Backups/$1_*
    cp $to_backup $"backups/${1}_${current_day}__${current_time}.${filetype}" 
}


mkdir -p Backups



read -p "enter filepath to File to Backup: " to_backup
filename="${to_backup##*/}"
filetype="${filename##*.}"
echo Filetype: $filetype
echo;echo;echo



declare -i itter=1
while true; do
    for i in $(seq 0 24); do
        for j in $(seq 0 60); do
            sleep 60
            copy "S" "MINUTE" $itter
            let "itter++"
        done
        copy "F" "HOUR" $itter
        let "itter++"
    done
    copy "G" "DAY" $itter
    let "itter++"
done


read -p "press enter to close this window"

