export SPARK_HOME=/opt/spark
export SPARK_JARS=""

for jar in `ls $SPARK_HOME/jars`; do 
  if ! echo $jar | grep -q 'slf4j\|mysql\|datanucleus\|^hive'; then
    export SPARK_JARS=$SPARK_JARS,$SPARK_HOME/jars/$jar
  fi
done

VAR=${SPARK_JARS#?};
export HIVE_AUX_JARS_PATH=$VAR