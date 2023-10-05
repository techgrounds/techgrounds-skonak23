# IaC v1.1 - manual for deployment

This Infrastructure as Code deploys an application in one (1) resource group. The resource group is created immediately during deployment. The same applies to the location. In this documentation, we will walk through it step by step.

## Prerequisites

- VSCode
- Bicep extension for vscode.

For this deployment, we are using the Azure CLI. [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli). Ensure that you have the latest version installed.

## Deployment setup
1. Check subscription - if you are already in the correct Azure subscription, proceed. Otherwise, create one.

2. If you have multiple subscriptions or Azure/Microsoft accounts: Log in with the correct Azure subscription. Check using:

`az account list` 

If you have many sandboxes, it might be useful to avoid confusion by running:

`az account clear`

If az account list shows one correct account, simply run:

 `az login`. 

3. Now that we are logged in correctly, we can deploy the Bicep files. Please ensure that you are in the correct directory where you can invoke the main.bicep file. To navigate to the right directory, use:

## Deployment
Deployment begins with the following line of code:

`az deployment sub create --location uksouth --template-file main.bicep`

This deploys the application in the Azure Region:  **uksouth**


4. The code will now start running. It will prompt you to enter Admin Username and Password. These are used for several resources that require Login Credentials. 


5. After entering credentials, the deployment will now commence. Total deployment time varies but is usually approx. 8 minutes.

