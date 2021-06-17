# DevStack and Terraform

This repo contains a demonstration of how to stand up DevStack and automate management operations and tenant onboarding with Terraform.

## Outcomes

- Working OpenStack managed via IaaC using Terraform

## Requirements

Given that DevStack is running in Virtual Box on your laptop we will use Terraform Agents to access this environment. If you do not have access to Terraform Cloud and the agents (trial required), then please run locally with `terraform plan && terraform apply`

It is expected that you have a workspace and a repository linked together and can perform VCS operations with Terraform Cloud
## Step by Step

Fork or clone the #Commented branch of this repo. This will ensure you can follow the rest of this guide.

### Agents Up

For those running Terraform Cloud we will use Terraform Agents to access this private environment.

- Run the Terraform Agent based on your environments instructions.
  - [Documentation](https://www.terraform.io/docs/cloud/agents/index.html) here
  - Run `export TFC_AGENT_TOKEN=<your-token-here> TFC_AGENT_NAME=devstack-laptop-agent`
  - Then run `docker run -e TFC_AGENT_TOKEN -e TFC_AGENT_NAME hashicorp/tfc-agent:latest`
- Validate you have a running and connected Agent with the following log output into the terminal
  
```
2021-06-15T02:56:54.845Z [INFO]  agent: Starting: name=devstack-laptop-agent version=0.1.12
2021-06-15T02:56:54.975Z [INFO]  core: Starting: version=0.1.12
2021-06-15T02:56:56.112Z [INFO]  core: Agent registered successfully with Terraform Cloud: id=agent-s8ZURdZWwxxFoh1h pool-id=apool-isZNwShQdfEFuVpA
2021-06-15T02:56:56.222Z [INFO]  agent: Core update is available: version=0.2.1
```

- Validate your Terraform Cloud workspace (if using) is set to `Execution Mode = Agent` and the agent pool that your agent resides within is selected

### Machine Creation

To get started we will use Vagrant. This will automatically manage the machine that DevStack is hosted on.

If you need to add resources modify line `16` and line `20` of `Vagrantfile` to increase memory or CPU cores. The minimum is set as `4` core and `8192` MB of memory.

Run `vagrant up` from this directory to boot the machine. This will perform the following:

- Boot a VM
- Run Ansible
- Install DevStack (This will take 30 minutes)
- Browse to `http://10.123.123.123` and login with `admin` and `secret`

### Project Creation

The first step is creating out Projects. This is akin to a tenant. The project is very much like a Workspace within Terraform Cloud. A user can be a member of one or many projects and have different access and permissions.

1. Ensure all of `main.tf` is uncommented
2. Uncomment lines `1` to `15` of `project.tf`
3. Create a PR or follow your git ops process
4. Validate the creation of three projects, `project_boromir, `project_faramir`, and `project_denethor`.

### User Creation

We need some users to log in with. We are not using an identity provider in this example. There are three components on this.

- A User Identity
- A User Role
- A User/Role/Group mapping

To create our three users we will look within the `users.tf` file.

1. Uncomment the entire file `users.tf`
2. Create a PR or follow your git ops process
3. Validate by logging in with `Boromir`, `Denethor`, or `Faramir` users with the password `Hashi123!`.
   
   **NOTE** There is no group definition at this time ergo a user may not be able to see their default project. This changes between different versions of OpenStack. (Queens, if I remember correctly)

### User Group Modification

We need to add our users to groups and assign those groups visibility to their projects. This is done via groups and is in the `iam.tf` file. This is the following flow:

- A user is assigned to a group
- A role is assigned a group
- A group and a role is assigned to a project

This will result in the following

- The user `Faramir` being assigned to the `project-a` group. It will only see `project-faramir`
- The user `Boromir` being assigned to the `project-b` group. It will only see `project-boromir`
- The admin user `Denethor` being assigned to the `project-denthor`. It will see `project-faramir`, `project-boromir`, and `project-denethor`.

To execute

1. Uncomment the entire file `iam.tf`
2. Create a PR or follow your git ops process
3. Validate by logging in with `Boromir`, `Denethor`, or `Faramir` users with the password `Hashi123!`
4. The behavior described above will be enforced


### Project Modification

The goal here is to provide different resource quotas for projects as a way of allocating a ceiling to these projects. This ensures different requirements are met but protects integrity of resources of the underlying infrastructure.

1. Uncomment lines `16` to `44` of `project.tf`
2. Create a PR or follow your git ops process.
3. Validate the Terraform run
4. Login with `faramir` and `Hashi123!` at `10.123.123.123/dashboard/project/`.
5. Note the project quotas.
6. Logout and login with `boromir` and `Hashi123!` to `10.123.123.123/dashboard/project/`
7. Compare the different quotas between projects.

### Default Firewall creation

Terraform cannot modify the default Neutron rules for new projects. Therefore we will make a new default security group with approved rules. This will get used for the default neutron rule in OpenStack.

1. Uncomment the entire file `security.tf`
2. Create a PR or follow your git ops process
3. Validate by logging in with `Boromir`, `Denethor`, or `Faramir` users with the password `Hashi123!`.
4. Browse to security and note the security group created.

## Additional optimisation

There is room for optimisation of code here by developing modules for:

- Firewall rule creation
- Project Creation and user allocation
- Group to Project allocation