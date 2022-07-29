kubectl exec -it pod/hadoop-hadoop-hdfs-dn-5 -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh stop regionserver
kubectl exec -it pod/hadoop-hadoop-hdfs-dn-4 -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh stop regionserver
kubectl exec -it pod/hadoop-hadoop-hdfs-dn-3 -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh stop regionserver
kubectl exec -it pod/hadoop-hadoop-hdfs-dn-2 -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh stop regionserver
kubectl exec -it pod/hadoop-hadoop-hdfs-dn-1 -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh stop regionserver
kubectl exec -it pod/hadoop-hadoop-hdfs-dn-0 -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh stop regionserver
kubectl exec -it pod/hadoop-hadoop-hdfs-nn-0 -c hbase-master -- /opt/hbase/bin/hbase-daemon.sh stop master

kubectl exec -it pod/hadoop-hadoop-hdfs-nn-0 -c hbase-master -- /opt/hbase/bin/hbase-daemon.sh start master
kubectl exec -it pod/hadoop-hadoop-hdfs-dn-0 -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh start regionserver
kubectl exec -it pod/hadoop-hadoop-hdfs-dn-1 -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh start regionserver
kubectl exec -it pod/hadoop-hadoop-hdfs-dn-2 -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh start regionserver
kubectl exec -it pod/hadoop-hadoop-hdfs-dn-3 -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh start regionserver
kubectl exec -it pod/hadoop-hadoop-hdfs-dn-4 -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh start regionserver
kubectl exec -it pod/hadoop-hadoop-hdfs-dn-5 -c hbase-regionserver -- /opt/hbase/bin/hbase-daemon.sh start regionserver
