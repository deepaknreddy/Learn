For example, in the code snippet new Vpc(this, 'vpc', { ... }), Vpc is a construct representing an AWS Virtual Private Cloud resource. The new keyword invokes the constructor of the Vpc construct, passing the required parameters to set up the VPC resource.  
construct can also represent a set of resources.

To summarize, constructs in CDK for Terraform represent cloud resources or abstractions, while constructors in TypeScript are special methods used to initialize objects of a class.

Terraform modules are limited in the sense that they can generate resources based on HCL configuration, but constructs are not constrained to just creating, and can also modify, enrich, and validate resources created outside of the construct.
