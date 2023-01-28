# Intro
This is a test task I did for one of my job interviews. All the requirements are in the [requirements](./requirements.md) file.
After installing it you will have a local Minikube running, with a demo NodeJS app and a MongoDB in it. App and DB are installed with helm, while Helm is applied via Terraform.

# Setup
Install minikube https://minikube.sigs.k8s.io/docs/start/

```bash
# create the minikube cluster
minikube start
# in another window do 
minikube tunnel
# then do
terraform apply --auto-approve

```

# Cleanup

```bash
bash shutdown.sh
```

# Access container in browser
```bash
# get ip from EXTERNAL-IP of the output of 
kubectl -n hubstaff-local get services
# and paste it to the browser address field. It should be available at port 80
```