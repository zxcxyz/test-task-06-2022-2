### Setup
Install minikube https://minikube.sigs.k8s.io/docs/start/

```bash
# create the minikube cluster
minikube start
# in another window do 
minikube tunnel
# then do
terraform apply --auto-approve

```

### Cleanup

```bash
bash shutdown.sh
```

### Access container in browser
```bash
# get ip from EXTERNAL-IP of the output of 
kubectl -n hubstaff-local get services
# and paste it to the browser address field. It should be available at port 80
```