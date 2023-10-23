# Cloudflare Terraform Template

Basic repository template for new [Cloudflare Terraform](https://developers.cloudflare.com/terraform/) projects.

A `Justfile` (think `Makefile`, see [`just`](https://just.systems) for more information) can be installed by running `brew install just`. This is included for convenience but isn't required. 

## Get Started

```sh
$ gh repo create REPO_NAME --template 25thhour/cf-terraform-template
# if you have just installed
$ just init
# alternatively
$ cd terraform && cp terraform.tfvars.example terraform.tfvars
```

### Variables

```sh
$ cd terraform
$ cp terraform.tfvars.example terraform.tfvars
```

Update the `terraform.tfvars` file with appropriate values.

As this file may end up containing **secrets** it's listed in the repository [`.gitignore`](./.gitignore) file to prevent accidental commits to version control.

### Authentication

It is recommended to create a _scoped_ [API Token](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/) and assign this secret to a `CLOUDFLARE_API_TOKEN` environment variable. See [Dotenv](#dotenv---environment-variables) for details.

🚨 **NOTE**: whilst it's possible to instead use a [`Global API key`](https://developers.cloudflare.com/fundamentals/api/get-started/keys/) to authenticate against the Cloudflare API, this is **not** recommended. Security best practice would be to use an appropriately _scoped_ [API Token](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/).

### Dotenv - Environment Variables

At a minimum the following environment variables are required.

| Name                  | Use Case              |
| --------------------- | --------------------- |
| AWS_ACCESS_KEY_ID     | Authenticating to R2  |
| AWS_SECRET_ACCESS_KEY | Authenticating to R2  |
| AWS_S3_ENDPOINT       | R2 storage endpoint   |
| CLOUDFLARE_API_TOKEN  | Scoped API token      |

#### 1Password

An `.env.example` is bundled with 1Password placeholders (`op://`).
If you're using 1Password, update with appropriate secret paths then run the following command to inject these values into a `.env` output file:

```sh
$ just dotenv
```

#### Not using 1Password

Manually copy `.env.example` to `.env` then replace the 1Password placeholders (`op://…`) with your secret values.

```sh
$ cp .env.example .env
```