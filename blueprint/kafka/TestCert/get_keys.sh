#!/usr/bin/env bash

rm truststore.jks user.p12

kubectl get secret test -o jsonpath='{.data.user\.crt}' > user.crt
kubectl get secret test -o jsonpath='{.data.user\.key}'  > user.key
kubectl get secret kafka-cluster-ca-cert -o jsonpath='{.data.ca\.crt}' > ca.crt

echo "yes" | keytool -import -trustcacerts -file ca.crt -keystore truststore.jks -storepass 123456
RANDFILE=/tmp/.rnd openssl pkcs12 -export -in user.crt -inkey user.key -name my-user -password pass:123456 -out user.p12

rm user.crt user.key ca.crt
