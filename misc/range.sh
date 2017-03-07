#!/bin/sh

rangeStart=`echo $1|awk -F"-" '{print $1}'`
rangeEnd=`echo $1|awk -F"-" '{print $2}'`
leadEnd=`echo -n ${rangeEnd}|wc -c|awk '{print $1}'`

if [ ! $2 ]; then

while [ ${rangeStart} -le ${rangeEnd} ]
        do
                lead=`echo -n ${rangeStart}|wc -c|awk '{print $1}'`
                        if [ "$lead" -le "$leadEnd" ]; then
                                let cnt=${leadEnd}-${lead}
                                        for x in `./range.sh 1-${cnt} 1`
                                                do
                                                        echo -n 0
                                                done
                                echo ${rangeStart}
                        else
                                echo ${rangeStart}
                        fi
                let rangeStart=${rangeStart}+1
        done

else

while [ ${rangeStart} -le ${rangeEnd} ]
        do
                echo ${rangeStart}
                let rangeStart=${rangeStart}+1
        done

fi

exit 0
