@_default:
    just --list

# format the Justfile
@fmt:
    just --fmt --unstable

# create terraform.tfvars
@init:
    echo "📝 Creating terraform/terraform.tfvars"
    cd terraform && cp terraform.tfvars.example terraform.tfvars
    echo "💡 Remember to update the placeholder values"

# set env vars from 1Password
@dotenv:
    echo "💉 Injecting secrets into .env"
    op inject -i .env.example -o .env > /dev/null
    echo "✨ .env written successfully"
    echo "💡 Done. Remember to source .env"


# remove secrets
cleanup:
    echo "Removing .env file"
    rm .env
    echo "Removing terraform.tfvars file"
    cd terraform && rm terraform.tfvars

#-----------------------------------------------------------
# Terraform
#-----------------------------------------------------------

tf-init *args:
    terraform -chdir=terraform init {{ args }}

tf-plan:
    terraform -chdir=terraform plan

tf-apply *args:
    terraform -chdir=terraform apply {{ args }}

# output a single resource
tf-output resource:
    terraform -chdir=terraform output -json {{ resource }}

# outputs all resources
tf-outputs:
    terraform -chdir=terraform output -json

# 🔥 danger
tf-destroy:
    terraform -chdir=terraform destroy
