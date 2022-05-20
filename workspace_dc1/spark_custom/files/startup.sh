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