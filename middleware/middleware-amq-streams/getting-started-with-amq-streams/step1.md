`oc new-project kafka`{{execute}}

`oc create -f ~/amq-streams-subs.yaml`{{execute}}

`oc get crd | grep "strimzi"`{{execute}}
<!--stackedit_data:
eyJoaXN0b3J5IjpbNjk5MTA1NTAyXX0=
-->