


topics ="cps_out_order_record_confirm|cps_out_accountentry_confirm|cps_out_accountbalance_confirm|cps_out_customer_confirm|cps_out_customer_kyc_confirm|cps_out_organization_confirm|cps_out_org_kyc_confirm|cps_out_product_confirm|cps_out_org_operator_kyc_confirm|cps_out_operator_confirm|cps_out_identifier_confirm|cps_out_till_confirm"

temp ="""

apiVersion: kafka.strimzi.io/v1beta2
kind: KafkaTopic
metadata:
  name: {}
  labels:
    strimzi.io/cluster: kafka
spec:
  partitions: 6
  replicas: 2
  config:
    retention.ms: 604800000 
---
"""

topics=topics.split('|')

for topic in topics:
    temp1 =temp.format(topic)
    print(temp1)

    