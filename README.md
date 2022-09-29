# Deploy a Flask app on an EC2 instance and stream data to an S3 bucket through Kinesis Firehose

This project was created with Hashicorp Terraform ,Ansible and Flask.

## Available scripts

First we create the basic infrastructure with Terraform, we created a **VPC**, an **EC2** instance (http server) and a **Kinesis Firehose** to stream our data to an **S3 Bucket** .
You need to go to the Terraform folder and run the following commands :

```
terraform init
terraform apply -var-file="prod.tfvars
```

_Note : Do not forget to configure your aws credentials with `aws configure` before running the Terraform commands._

Next, after checking that your infrastructure is set up as expected, go to the Ansible directory and run the following commands :

```
ansible-playbook -i hosts machine_initial_setup.yml
ansible-playbook -i hosts nginx_certs_setup.yml
ansible-playbook -i hosts flaskapi_setup.yml
```

_Note : Make sure you update the hosts file with your domain name and put your private-key.pem file inside the Ansible directory_

And you're all good ! Here's a snapshot of what you should be getting when you acces your_domain/apidocs :

![This is an image](/assets/images/flask-api-docs.png)
