#!/bin/bash
set -x
for i in {5..0}
do
   if [ $i -gt 0 ]
   then
   kubectl exec pods/hadoop-hadoop-hdfs-dn-$i -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh stop regionserver
   else
   kubectl exec pods/hadoop-hadoop-hdfs-nn-0 -c hbase-master -- /opt/hbase/bin/hbase-daemon.sh stop master
   fi
   #powershell -c "kubectl exec pods/hadoop-hadoop-hdfs-nn-0 -c hbase-master -- /opt/hbase/bin/hbase-daemon.sh start master"
   #powershell -c "kubectl exec pods/hadoop-hadoop-hdfs-dn-$i -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh start regionserver"
done
   echo "Hbase Stopped"

   kubectl exec pods/hadoop-hadoop-hdfs-nn-0 -c hbase-master -- /opt/hbase/bin/hbase-daemon.sh start master
for i in {0..5}
do
   #if [ $i -gt 5 ]
   #then
   kubectl exec pods/hadoop-hadoop-hdfs-dn-$i -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh start regionserver
   #else
  # fi
   #powershell -c "kubectl exec pods/hadoop-hadoop-hdfs-nn-0 -c hbase-master -- /opt/hbase/bin/hbase-daemon.sh stop master"
   #powershell -c "kubectl exec pods/hadoop-hadoop-hdfs-dn-$i -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh stop regionserver"
done

