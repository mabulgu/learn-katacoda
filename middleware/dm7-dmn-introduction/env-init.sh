ssh root@host01 'echo "Importing Red Hat Decision Manager 7 Image Streams into OpenShift." >> script.log'
# Create the ImageStreams
ssh root@host01 'for i in {1..200}; do oc create -f https://raw.githubusercontent.com/jboss-container-images/rhdm-7-openshift-image/7.2.0.GA/rhdm72-image-streams.yaml -n openshift && break || sleep 2; done'
ssh root@host01 'echo "Importing Red Hat Decision Manager 7 templates into OpenShift." >> script.log'
# Patching Image streams
ssh root@host01 'echo "Patching ImageStreams." >> script.log'
#ssh root@host01 'for i in {1..200}; do oc patch is/rhdm72-decisioncentral-openshift --type=json -p '\''[{"op": "replace", "path": "/spec/tags/0/from/name", "value": "registry.access.redhat.com/rhdm-7/rhdm72-decisioncentral-openshift:1.0"}'\'''
ssh root@host01 'echo "Patching ImageStreams 2." >> script.log'
#sh root@host01 'for i in {1..200}; do oc patch is/rhdm72-kieserver-openshift --type=json -p '\''[{"op": "replace", "path": "/spec/tags/0/from/name", "value": "registry.access.redhat.com/rhdm-7/rhdm72-kieserver-openshift:1.0"}]'\'''
ssh root@host01 'echo "Image Streams patched." >> script.log'
# Importing the templates
ssh root@host01 'for i in {1..200}; do oc create -f https://raw.githubusercontent.com/jboss-container-images/rhdm-7-openshift-image/7.2.0.GA/templates/rhdm72-trial-ephemeral.yaml -n openshift && break || sleep 2; done'
ssh root@host01 'echo "Logging into OpenShift as developer." >> script.log'
ssh root@host01 'for i in {1..200}; do oc login -u developer -p developer && break || sleep 2; done'
# Creating the project
ssh root@host01 'echo "Creating new dmn-demo project in OpenShift." >> script.log'
ssh root@host01 'for i in {1..200}; do oc new-project dmn-demo --display-name="DMN Demo" --description="Red Hat Decision Manager 7 - DMN Demo" && break || sleep 2; done'
# Importing Secrets and Servcice Accounts
ssh root@host01 'echo "Importing secrets and service accounts." >> script.log'
ssh root@host01 'for i in {1..200}; do oc process -f https://raw.githubusercontent.com/jboss-container-images/rhdm-7-openshift-image/7.2.0.GA/example-app-secret-template.yaml -p SECRET_NAME=decisioncentral-app-secret | oc create -f -'
ssh root@host01 'for i in {1..200}; do oc process -f https://raw.githubusercontent.com/jboss-container-images/rhdm-7-openshift-image/7.2.0.GA/example-app-secret-template.yaml -p SECRET_NAME=kieserver-app-secret | oc create -f -'
# Creating the application
ssh root@host01 'echo "Creating Decision Central and Decision Server containers in OpenShift." >> script.log'
ssh root@host01 'for i in {1..200}; do oc new-app --template=rhdm72-trial-ephemeral -p APPLICATION_NAME="dmn-demo" -p IMAGE_STREAM_NAMESPACE="openshift" -p KIE_ADMIN_USER="developer" -p KIE_ADMIN_PWD="developer" -p KIE_SERVER_CONTROLLER_USER="kieserver" -p KIE_SERVER_CONTROLLER_PWD="kieserver1!" -p KIE_SERVER_USER="kieserver" -p KIE_SERVER_PWD="kieserver1!" -p MAVEN_REPO_USERNAME="developer" -p MAVEN_REPO_PASSWORD="developer" -e JAVA_OPTS_APPEND=-Derrai.bus.enable_sse_support=false -n dmn-demo && break || sleep 2; done'