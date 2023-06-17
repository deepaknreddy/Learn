# cdktf docs: https://developer.hashicorp.com/terraform/cdktf

(to use modules written in typescript and provision infra using module block with HCL and vise-versa : https://developer.hashicorp.com/terraform/cdktf/concepts/hcl-interoperability )

### * install cdktf from cdktf-installation.md
1. CDKTF synthesizes infrastructure that you define in a supported programming language into JSON configuration files that Terraform can use to manage infrastructure.
2.The following diagram shows how synthesizing a CDKTF application produces a series of artifacts in a designated output folder. You can then either use the JSON file with Terraform directly or provision your infrastructure using CDKTF CLI commands. 
![image](https://github.com/deepaknreddy/Learn/assets/104769185/392635fb-1b85-49a4-aebc-6d00c93c9e64)

3.cdk tf has 2 main components:
Lib: This is the cdktf package that is the foundation for each CDKTF project. It contains all of the core libraries that allow you to leverage the Terraform ecosystem and synthesize your application into Terraform configuration files.

CLI: The cdktf CLI allows you to initialize a new CDKTF project, adjust project settings, synthesize your infrastructure into Terraform configuration files, deploy your CDKTF application, and more. Refer to the CLI commands documentation for more details. You can also use some Terraform CLI commands like terraform apply and terraform destroy directly, but we recommend using the available cdktf cli commands where possible.
4.cdktf cli commandline documentation: https://developer.hashicorp.com/terraform/cdktf/cli-reference/commands

**the architecture is just outline level, for more refer terraform website**

# Application Architecture:
CDKTF applications are structured as a tree of constructs, which the AWS documentation defines as "classes that define a 'piece of system state'". The foundational classes to build a CDKTF application are App, Stack, and Resource.
![image](https://github.com/deepaknreddy/Learn/assets/104769185/f42252f1-82c6-4e80-ace3-ff1b52e3cb36)

### app class:
Each CDKTF project has one or more App instances that act as a container for the infrastructure configurations you create and deploy. An App can have one or more Stacks that represent a collection of related infrastructure.

### stack class:
A Stack represents a collection of infrastructure resources that CDKTF synthesizes as a separate Terraform configuration. It is equivalent to a Terraform working directory.

Stacks allow you to separate the state management within an application. For example, you may want to deploy and manage separate infrastructure resources for development and testing. Reference the stack documentation for more details on when and how to use stacks in your project.
stack documentation: https://developer.hashicorp.com/terraform/cdktf/concepts/stacks

### resource class:
A Resource represents the definition for one or more infrastructure objects. Resources and their required attributes vary depending on the provider. Reference the resources documentation for more details.

### construct:
Rather than defining resources by hand, you can leverage constructs to reuse existing resource configurations written in your programming language. For example, you might create a construct that describes a Kubernetes deployment, import it into your application, and customize the deployment via the exposed properties.
