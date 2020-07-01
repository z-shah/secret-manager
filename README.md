# Secret-manager

Create and store service account keys in secret manager. 

#### Setup 

* Authenticate to the Cloud SDK

```
gcloud auth application-default login

```

* Configure TF environment variables

```
export TF_VAR_access_token=$(gcloud auth print-access-token)

```

```
export TF_VAR_project=

```

#### Execute terraform

```
terraform init

```

```
terraform plan

```
```
terraform apply 
```


### Note:

- When you create a service account key, it's plain text value will be stored in remote state. 
- This means anyone with access to the state file will be able to see the secret. 
  This is a known issue in Terraform, and you can read more about it on this [Terraform GitHub issue](https://github.com/hashicorp/terraform/issues/516)
