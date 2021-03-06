#!/bin/bash
case $1 in
"1"){
    for i in `cat /opt/module/hadoop-2.7.2/etc/hadoop/slaves`
    do
        echo "========== $i ==========" 
        ssh $i 'source /etc/profile&&/opt/module/kafka_2.11-0.11.0.2/bin/kafka-server-start.sh -daemon /opt/module/kafka_2.11-0.11.0.2/config/server.properties'
        echo $?
    done
};;
"0"){
    for i in `cat /opt/module/hadoop-2.7.2/etc/hadoop/slaves`
    do
        echo "========== $i ==========" 
        ssh $i 'source /etc/profile&&/opt/module/kafka_2.11-0.11.0.2/bin/kafka-server-stop.sh'
        echo $?
    done
};;
esac