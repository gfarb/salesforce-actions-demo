# :cloud: GitHub Actions Demo for Salesforce Projects :cloud:

<div align="center">
   <img width=750 src="https://user-images.githubusercontent.com/22826414/190887130-5c8638d1-d5c1-4579-8164-717216c09661.png">
</div>
</br>

This repository was created to demo how the GitHub Actions platform can be leveraged to improve Salesforce CI/CD pipelines resulting in superior developer and user experiences while saving time and resources. :octocat:

The demo was presented by [gfarb](https://github.com/gfarb) for the 20th anniversary of Dreamforce (2022). The [slide deck](/demo-files/GitHub%20Actions%20Dreamforce%20'22%20Deck.pdf) contains information on Continuous Integration, Continuous Delivery, Continuous Deployment, GitHub Workflows and GitHub Actions as well as additional relevant information pertaining to the demo and this repository.

## Configuration

1. Fork this repository.
1. [Create a Developer Experience org](https://developer.salesforce.com/signup) if you do not have one readily available.
1. [Set up `sfdx`](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm) if it's not already configured globally on your device.
1. [Create a private key and self-signed digital certificate](https://developer.salesforce.com/docs/atlas.en-us.210.0.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_key_and_cert.htm) for JWT auth flow.
1. [Create a new connected app](https://developer.salesforce.com/docs/atlas.en-us.210.0.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_connected_app.htm) for the JWT auth flow and make sure you are pre-authorized.
1. In your forked repository on GitHub, configure the following [GitHub Action secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets#about-encrypted-secrets) in the Settings tab:
   1. `SFDX_USERNAME`: stores the Salesforce username used for `sfdx` commands
   1. `SFDX_CLIENT_ID`: stores the client id for the connected app you created
   1. `SFDX_JWT_KEY`: stores the private key you generated for JWT auth flow
1. Locally check out your forked repository and in the project's root directory:
   1. Run `npm install`
   1. Using `sfdx` authorize your Developer Experience org and set your default username

## Example Workflow

Within this repository there is a single GitHub Workflow pre-configured to automate the Salesforce build, test and deploy process. The `Deploy to Salesforce` workflow ([`on-push-to-main`](/demo-files/workflows/on-push-to-main.yml)) will do the following when you push to the default branch:

1. Check out your forked repository.
1. Set up Node.
1. Cache Node modules and install dependencies if necessary.
1. Authenticate your target Salesforce org using the JWT flow.
1. Use [`Salesforce Deploy Action`](https://github.com/marketplace/actions/salesforce-deploy-action) to create a manifest from your source files by running the `force:source:convert` command, and execute the `force:source:deploy` command to test in and deploy to your target environment.
1. If destructive changes are present the contents within the `destructive-changes` directory will be removed and the changes will be committed using the public [`Git Auto Commit`](https://github.com/marketplace/actions/git-auto-commit) GitHub Action.

## Demo Recordings

###### You can reset the demo by running `scripts/demo/reset-demo` locally in your forked repository's root directory.

#### Initial Deploy w/ Destructive Change

https://user-images.githubusercontent.com/22826414/190487760-5f96005c-24e0-4bb8-83fb-915f372652b6.mp4

#### Identifying CI/CD Bug

https://user-images.githubusercontent.com/22826414/190488377-8fc4fb14-4307-4cab-b2c6-ab2214c39852.mp4

#### Fixing CI/CD Bug

https://user-images.githubusercontent.com/22826414/190488505-7e2446af-babf-49ed-aac9-e3fd08fd9335.mp4

## Resources

- [Continuous Integration, Continuous Delivery & Continuous Deployment](https://resources.github.com/ci-cd/)
- [GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions)
- [GitHub Workflows](https://docs.github.com/en/actions/using-workflows/about-workflows)
- [Salesforce Deploy Action](https://github.com/marketplace/actions/salesforce-deploy-action)
- [GitHub Actions Marketplace](https://github.com/marketplace/actions)

## License

[MIT](LICENSE)
