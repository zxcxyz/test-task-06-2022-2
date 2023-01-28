# Task 2
## Please prepare deployment of the application from the previous task on the local Kubernetes cluster.
## TODO

## Done:
 - for the application pod nginx:latest container image will be perfectly fine - used ghcr.io/benc-uk/nodejs-demoapp
 - deployment should be automated using Terraform - done
 - please define network policies for the pods if possible - done
 - application should be exposed (accessible from the host machine) - done
 - please attach instruction on how to run/deploy the application - done
 - please describe in a few words how you set up the local K8S cluster, what tools do you use for that? - minikube
 - deployment can have a form of the Helm package (it's not required) - done
 - any type of ingress controller is allowed - no need, loadbalancer service does the job
 - in a few words, please describe how you would build a perfect CI/CD pipeline for
   the mentioned application - I would use Azure Devops or similar tools. Have pipelines first build and push docker, and then updating image.tag in helm chart or ECS. If we have several envs I would do deploy to dev automatically, and to other envs conditionally.