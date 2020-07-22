# Glasswall materials

I will use the code files contained in this repository and the CI/CD pipleline diagram in the presentation to explain a pipeline process using Github, Jenkins, Packer and Terraform

Github:

Github will be used as a repository for our development and production code. development code will be set up on a 'branch' (we will call the example branch "dev") and the final 
production code will be on a 'master' branch.

Jenkins: 

we use Jenkins to set up a development environment for our code. Jenkins will need to have development servers up called 'slave' nodes (may be called something else in the future)
which will test our code in the environment. Once these are set up, Jenkins will detect a push to a dev branch and use that code to run tests in the 'slave' node. if that test is successful
then it will automatically initiate a merge with the master code which will then get updated with new code. we can then set up a new job on Jenkins with a 'pipeline' node to
use the master code and initiate a Packer build.

Packer:

Packer is a tool that will construct a virtual machine image which can then be used to start up a virtual machine on a cloud service with that image. in this example we are using AWS
to create an AMI (Amazon Machine Image) which will be based on our master code from before.

Terraform:

Terraform completes the pipeline by calling to a cloud service to spin up a Virtual machine using our Packer-created image. Terraform can also create a network structure to
support the VM with security and networking.
