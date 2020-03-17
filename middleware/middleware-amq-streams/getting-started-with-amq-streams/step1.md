`oc new-project kafka`{{execute}}

`oc create -f ~/amq-streams-subs.yaml`{{execute}}

`oc auth can-i create kafkas.kafka.strimzi.io`{{execute}}

`oc api-resources --api-group kafka.strimzi.io`{{execute}}

`oc get crd | grep "strimzi"`{{execute}}
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTYzOTQwMDM1MSw2OTkxMDU1MDJdfQ==
-->