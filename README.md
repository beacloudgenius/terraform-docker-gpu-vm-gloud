## Create a GCP project and a service account

```
gcloud projects create <your>-dl --enable-cloud-apis
gcloud config set project  <your>-dl
gcloud services enable compute.googleapis.com
gcloud iam service-accounts create gcp-terraform-dl --display-name gcp-terraform-dl
gcloud projects add-iam-policy-binding  <your>-dl \
            --member='serviceAccount:gcp-terraform-dl@<your>-dl.iam.gserviceaccount.com' \
            --role='roles/owner'

gcloud iam service-accounts keys create 'credentials.json' \
            --iam-account='gcp-terraform-dl@<your>-dl.iam.gserviceaccount.com'
```

Replace <your>-dl with your desired project id.

## Request Quota

Unfortunately you have to request a quota for the GPU (it was working for me until Dec. 2018 without it). Please follow the advise from this [Stackoverflow article](https://stackoverflow.com/questions/45227064/how-to-request-gpu-quota-increase-in-google-cloud). The handling of this request can take up to 2 days.

## Install terraform

```
brew install terraform
```

## Roll out the changes

```
terraform init
terraform apply
```

## Destroy the machine

```
terraform destroy
```

https://github.com/zzh8829/yolov3-tf2

https://cloud.google.com/blog/products/ai-machine-learning/introducing-deep-learning-containers-consistent-and-portable-environments

https://www.tensorflow.org/install/docker#examples_using_gpu-enabled_images

https://www.tensorflow.org/install/gpu

# Find docker images

    gcloud container images list --repository="gcr.io/deeplearning-platform-release"

# Run a container

    docker run --runtime=nvidia -d -p 80:8080 -v ~/:/home gcr.io/deeplearning-platform-release/tf2-gpu.2-1

# Run independent job outside notebook

    docker run --runtime=nvidia -d -v ~/:/home gcr.io/deeplearning-platform-release/tf2-gpu.2-1  python3 /home/somefolder/train.py
