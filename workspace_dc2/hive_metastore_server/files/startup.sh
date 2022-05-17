#!/bin/bash

# : ${HADOOP_PREFIX:=/usr/local/hadoop}

# . $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

# Directory to find config artifacts
# CONFIG_DIR="/tmp/hadoop-config"

#export HADOOP_YARN_HOME="/opt/hadoop/etc/hadoop"

#set -x

# Copy config files from volume mount
# for f in slaves core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml; do
   # if [[ -e ${CONFIG_DIR}/$f ]]; then
   # cp ${CONFIG_DIR}/$f $HADOOP_HOME/etc/hadoop/$f
   # else
   # echo "ERROR: Could not find $f in $CONFIG_DIR"
   # exit 1
   # fi

# Note. This script set hive paths in hdfs with user hive and ensures hiveServer is runAsUser hive 

# if id -u hive ; then
   # echo "hive user exists";
# else
   # echo "Creating hive user";
   # groupadd -g 500 -r hive && \
   # useradd --comment "Hive user" -u 500 --shell /bin/bash -M -r -g hive hive
# fi

# if [ ! -d "/tmp/hive" ]; then
  # # Take action if /tmp/hive does not exists. #
# HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -mkdir /tmp
# fi
# if [ ! -d "/hive/warehouse" ]; then
  # # Take action if /hive/warehouse does not exists. #
  # HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -mkdir -p /hive/warehouse
# fi

# #HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chmod -R 755 /tmp
# #HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chmod g+w /tmp
# #HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chown -R hive:hive /tmp/hive
# #HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chown -R hdpusers:hdpusers /tmp
# #HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chmod 777 /hive
# #HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chown hive:hive /hive
# HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chmod -R 777 /hive
# HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chown -R hive:hive /hive




# if [[ whoami != hive ]]
# then 
   # echo "Switching to hive user";
   # su hive -c "cd $HIVE_HOME/bin; ./hiveserver2 --hiveconf hive.server2.enable.doAs=false"
# else
   #cd $HIVE_HOME/bin; ./hiveserver2 --hiveconf hive.server2.enable.doAs=false --hiveconf hive.root.logger={{ .Values.conf.logLevel }},console
# fi
# cp /opt/hive/lib/guava-19.0.jar /opt/hadoop/share/hadoop/hdfs/lib/guava-19.0.jar
# rm /opt/hadoop/share/hadoop/hdfs/lib/guava-11.0.2.jar
# cp /opt/hadoop/share/hadoop/yarn/hadoop-yarn-api-3.1.1.jar /opt/hadoop/share/hadoop/yarn/hadoop-yarn-common-3.1.1.jar /opt/hadoop/share/hadoop/yarn/hadoop-yarn-services-api-3.1.1.jar /opt/hadoop/share/hadoop/common/hadoop-common-3.1.1.jar /opt/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-client-core-3.1.1.jar /opt/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-client-common-3.1.1.jar /opt/hive/lib/
# mkdir /var/log/spark
rm -rf  $SPARK_HOME/jars/hive*1.2.1*
if [ "$HIVE_MODE" == "server" ]; then
   # if [[ whoami != hive ]]
   # then 
      # echo "Switching to hive user";
      # su hive -c "/opt/hive/bin/hive --service hiveserver2 --hiveconf hive.server2.thrift.port=10000 --hiveconf hive.root.logger=DEBUG,ERROR,INFO,console"
   # else
      # /opt/hive/bin/hive --service hiveserver2 --hiveconf hive.server2.thrift.port=10000 --hiveconf hive.root.logger=DEBUG,ERROR,INFO,console  
   # fi	  
   /opt/hive/bin/hive --service hiveserver2 --hiveconf hive.server2.thrift.port=10000 --hiveconf hive.root.logger=DEBUG,ERROR,INFO,console  
fi

if [ "$HIVE_MODE" == "metastore" ]; then
   # if [[ whoami != hive ]];
   # then 
      # echo "Switching to hive user";
      # su hive -c "/opt/hive/bin/hive --service metastore --hiveconf hive.root.logger=DEBUG,ERROR,INFO,console"
   # else
      # /opt/hive/bin/hive --service metastore --hiveconf hive.root.logger=DEBUG,ERROR,INFO,console  
   # fi	
   /opt/hive/bin/hive --service metastore --hiveconf hive.root.logger=DEBUG,ERROR,INFO,console   
fi

. /opt/spark/conf/spark-env.sh

if [ "$SPARK_MODE" == "master" ]; then
   . "/opt/spark/sbin/spark-config.sh"

   . "/opt/spark/bin/load-spark-env.sh"

   mkdir -p $SPARK_MASTER_LOG

   ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out

   cd /opt/spark/bin && /opt/spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out
    # Master constants
    #./sbin/start-master.sh
    info "** Starting Spark in master mode **"
else
    . "/opt/spark/sbin/spark-config.sh"

    . "/opt/spark/bin/load-spark-env.sh"

    mkdir -p $SPARK_WORKER_LOG

    ln -sf /dev/stdout $SPARK_WORKER_LOG/spark-worker.out

    /opt/spark/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER_URL -c $SPARK_EXECUTION_CORES >> $SPARK_WORKER_LOG/spark-worker.out
    # Worker constants
    #./sbin/start-slave.sh $SPARK_MASTER_URL
    info "** Starting Spark in worker mode **"
fi

# chmod +x /opt/spark/bin/load-spark-env.sh
# . /opt/spark/conf/spark-env.sh
# . /opt/spark/sbin/spark-config.sh
# . /opt/spark/bin/load-spark-env.sh

# mkdir -p $SPARK_MASTER_LOG
# mkdir -p $SPARK_WORKER_LOG

# ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out
# ln -sf /dev/stdout $SPARK_WORKER_LOG/spark-worker.out

# cd /opt/spark/bin && /opt/spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
   # --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out

# info "** Starting Spark in master mode **"

    
# /opt/spark/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker \
    # --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER_URL >> $SPARK_WORKER_LOG/spark-worker.out

# info "** Starting Spark in worker mode **"