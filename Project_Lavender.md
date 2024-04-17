The lab environment was built for students to apply the skills they learned and practice against other teams.  This environment included a domain controller, member server and a metasploitable 2 Linux host.  As shown in the image below each group had their own group of servers that they would access through a VPN connected to a pfSense firewall.  

The configuration of the environment was conducted through ansible.  All of the ansible scripts used are located in this repo under the folder called "ansibleDeployment".  Using proxmox a Windows 2019 trial license was utilized to build the base server OS, networking was configured, and ansible using powershell remoting was configured.  Then a template was created to deploy the 10 Windows Server 2019 servers for the 5 groups.  Metasploitable2 was downloaded as a vmdk file and recently proxmox has made it easy to import a vmdk to an ext4 folder.  After the VM is launched with the configuration of an IDE drive, you can shutdown the VM and then clone to other storage locations.

For monitoring the environment an ELK server was built with the windows hosts sending their logs to the server.  The purpose of this was only basic monitoring of the environment.  The basic monitoring included authentications, process monitoring, scheduled task creation, creation of users and other activities.

The "scoreboard" shown in the diagram below was not used due to it not being completed.  The intent was to have the student provide a connection from the server that they had compromised and report a unique flag.  The flag was assigned to them and only known by them.  This scoring will make sense as the structure of the lab is explained below. 

_Structure of Building the Lab_

**Stage 1** - Each group was given a domain account on all of the servers.  The purpose of this access was to learn their environment and then apply initial access, privilege escalation, persistence and other tactics.  This access was provided for 1 week.

**Stage 2** - At the beginning of this stage the groups would remove the access of the other groups.  However, prior to removing the access, each group would report the access they established on the other groups.  After access was removed the groups would identify the access other groups had created and plan to remove the access.

**Stage 3** - This stage allows the groups to remove access from the other groups.  As they remove the access they document what they found and how they removed the access.  The groups where access was removed, if it was not all of the way removed they could go back in and add their access.

**Stage 4** - This stage is actually conducted after access is removed by the groups, but it involves each participant as an individual.  They create their own initial access, privilege escalation and persistence on the systems.  Then they try and maintain that persistence for 10 days and send 2 reports every day of the persistence.  The winner is dubbed the King of the Hill.  The required number of reports is 5 but to compete and win the King of the Hill 20 reports are reviewed and the quantity and quality would determine the individual that wins. 



![Lab Environment](/images/IT420Final.drawio.png)