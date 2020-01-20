`oc new-project kafka`{{execute}}

`oc create -f ~/amq-streams-subs.yaml`{{execute}}

`oc get crd | grep "strimzi"`{{execute}}

`oc get templates | grep "strimzi"`{{execute}}
