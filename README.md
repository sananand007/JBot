# JBot
Step By Step Configuration for setting up a Jenkins Pipeline using a GitHub Repo. 
This Golang Repo is used as a Canary Deployement for bringing up a On-Premise Always on Master-Slave architecture.

## OS
+ Master - Ubuntu 18.04
+ Slave -  Pi-OS [Raspbian-Linux]

## Infrastructure Tools
+ Jenkins

## Languages
+ GO
+ Bash


## Done
+ Setting up a Single Master Node with Jenkins
+ Setting up a Slave Node - Raspberry Pi
+ SSH to the Slave Node
+ Tested Git repo in Jenkins
+ PR trigger only on webhook or only on PR build Triggers, cannot do both
+ Setup Slack Integration with Jenkins
+ Git PostBuildScripts added 

### TODOs
+ Setup a Docker Environment in the Jenkins Slave
+ Push Images for Docker Registry
+ Setup a Jenkins github Actions as a check in the Reporsitory
+ Use K8's for all docker management and deployement of the cluster


## Maintainance
+ Setup a Docker clean/prune script - Maintainace Job
+ Setup a regular Clean up of Logs and kruft - Maintaiance Job