`oc new-project kafka`{{execute}}

`sed -i 's/namespace: .*/namespace: kafka/' install/cluster-operator/*RoleBinding*.yaml`{{execute}}

`oc apply -f ./install/cluster-operator`{{execute}}

`oc apply -f examples/templates/cluster-operator -n kafka`{{execute}}

`oc get crd | grep "strimzi"`{{execute}}

`oc get templates | grep "strimzi"`{{execute}}
