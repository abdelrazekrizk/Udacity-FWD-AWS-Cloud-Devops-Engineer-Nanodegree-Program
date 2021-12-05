# Project-4-ml-microservice-kubernetes

[![CircleCI](https://circleci.com/gh/abdelrazekrizk/Project-4-ml-microservice-kubernetes/tree/main.svg?style=svg)](https://circleci.com/gh/abdelrazekrizk/Project-4-ml-microservice-kubernetes/tree/main)


[![Lint Code Base](https://github.com/abdelrazekrizk/Project-4-ml-microservice-kubernetes/actions/workflows/super-linter.yml/badge.svg?branch=main)](https://github.com/abdelrazekrizk/Project-4-ml-microservice-kubernetes/actions/workflows/super-linter.yml)

# Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API.

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

## Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**
---
# Setup Instance Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
 - using Instance type
 - m5.2xlarge
 - 8 CPUs
 - 32 GB memory
 - ami-0747bdcabd34c712a

* Create a Public/Private Key Pair:

          ssh-keygen -t rsa

* Add Public/Private Key Pair to github:

# Setup the Environment
## Setup using python3-venv

          sudo apt-get install python3-venv

                Reading package lists... Done
                Building dependency tree
                Reading state information... Done
                The following additional packages will be installed:
                python-pip-whl python3-distutils python3-lib2to3 python3.6-venv
                The following NEW packages will be installed:
                python-pip-whl python3-distutils python3-lib2to3 python3-venv python3.6-venv
                0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.
                Need to get 1882 kB of archives.
                After this operation, 5044 kB of additional disk space will be used.
                Do you want to continue? [Y/n] y
                Get:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 python-pip-whl all 9.0.1-2.3~ubuntu1.18.04.5 [1653 kB]
                Get:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/main amd64 python3-lib2to3 all 3.6.9-1~18.04 [77.4 kB]
                Get:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/main amd64 python3-distutils all 3.6.9-1~18.04 [144 kB]
                Get:4 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 python3.6-venv amd64 3.6.9-1~18.04ubuntu1.4 [6188 B]
                Get:5 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 python3-venv amd64 3.6.7-1~18.04 [1208 B]
                Fetched 1882 kB in 0s (32.4 MB/s)
                Selecting previously unselected package python-pip-whl.
                (Reading database ... 85429 files and directories currently installed.)
                Preparing to unpack .../python-pip-whl_9.0.1-2.3~ubuntu1.18.04.5_all.deb ...
                Unpacking python-pip-whl (9.0.1-2.3~ubuntu1.18.04.5) ...
                Selecting previously unselected package python3-lib2to3.
                Preparing to unpack .../python3-lib2to3_3.6.9-1~18.04_all.deb ...
                Unpacking python3-lib2to3 (3.6.9-1~18.04) ...
                Selecting previously unselected package python3-distutils.
                Preparing to unpack .../python3-distutils_3.6.9-1~18.04_all.deb ...
                Unpacking python3-distutils (3.6.9-1~18.04) ...
                Selecting previously unselected package python3.6-venv.
                Preparing to unpack .../python3.6-venv_3.6.9-1~18.04ubuntu1.4_amd64.deb ...
                Unpacking python3.6-venv (3.6.9-1~18.04ubuntu1.4) ...
                Selecting previously unselected package python3-venv.
                Preparing to unpack .../python3-venv_3.6.7-1~18.04_amd64.deb ...
                Unpacking python3-venv (3.6.7-1~18.04) ...
                Setting up python-pip-whl (9.0.1-2.3~ubuntu1.18.04.5) ...
                Setting up python3.6-venv (3.6.9-1~18.04ubuntu1.4) ...
                Setting up python3-lib2to3 (3.6.9-1~18.04) ...
                Setting up python3-distutils (3.6.9-1~18.04) ...
                Setting up python3-venv (3.6.7-1~18.04) ...
                Processing triggers for man-db (2.8.3-2ubuntu0.1) ...

## Setup using Miniconda is a free minimal installer for conda. It is a small, bootstrap version of Anaconda

https://docs.conda.io/en/latest/miniconda.html#linux-installers

https://conda.io/projects/conda/en/latest/user-guide/install/linux.html

* Download Latest Miniconda Installer Links for Linux installers:

          wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh

 * Installing on Linux:

          bash Miniconda3-py39_4.10.3-Linux-x86_64.sh

          . .bashrc

          conda config --set auto_activate_base false

* Create a virtualenv and activate it:

          conda create --name .devops Python=3.6.9

          conda activate .devops

          conda list


* Run `make install` to install the necessary dependencies:
* install make:

          sudo apt install make

* Verify make version:

          make --version

         Output
         GNU Make 4.2.1
                Built for x86_64-pc-linux-gnu
                Copyright (C) 1988-2016 Free Software Foundation, Inc.
                License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
                This is free software: you are free to change and redistribute it.
                There is NO WARRANTY, to the extent permitted by law.

* Install requirements

            make install

            conda list

            Output
            # packages in environment at /home/ubuntu/miniconda3/envs/.devops:
                # Name                    Version                   Build  Channel
                _libgcc_mutex             0.1                        main
                _openmp_mutex             4.5                       1_gnu
                astroid                   2.8.3                    pypi_0    pypi
                ca-certificates           2021.9.30            h06a4308_1
                certifi                   2021.5.30        py36h06a4308_0
                click                     7.0                      pypi_0    pypi
                curl2requests             1.2                      pypi_0    pypi
                flask                     1.0.2                    pypi_0    pypi
                isort                     5.9.3                    pypi_0    pypi
                itsdangerous              1.1.0                    pypi_0    pypi
                jinja2                    2.10.3                   pypi_0    pypi
                lazy-object-proxy         1.6.0                    pypi_0    pypi
                libedit                   3.1.20210714         h7f8727e_0
                libffi                    3.2.1             hf484d3e_1007
                libgcc-ng                 9.3.0               h5101ec6_17
                libgomp                   9.3.0               h5101ec6_17
                libstdcxx-ng              9.3.0               hd4cf53a_17
                markupsafe                1.1.1                    pypi_0    pypi
                mccabe                    0.6.1                    pypi_0    pypi
                ncurses                   6.2                  he6710b0_1
                numpy                     1.17.2                   pypi_0    pypi
                openssl                   1.1.1l               h7f8727e_0
                pandas                    0.24.2                   pypi_0    pypi
                pip                       21.3                     pypi_0    pypi
                platformdirs              2.4.0                    pypi_0    pypi
                pylint                    2.11.1                   pypi_0    pypi
                python                    3.6.9                h265db76_0
                python-dateutil           2.8.0                    pypi_0    pypi
                pytz                      2019.3                   pypi_0    pypi
                readline                  7.0                  h7b6447c_5
                scikit-learn              0.20.3                   pypi_0    pypi
                scipy                     1.3.1                    pypi_0    pypi
                setuptools                58.0.4           py36h06a4308_0
                six                       1.12.0                   pypi_0    pypi
                sqlite                    3.33.0               h62c20be_0
                tk                        8.6.11               h1ccaba5_0
                toml                      0.10.2                   pypi_0    pypi
                typed-ast                 1.4.3                    pypi_0    pypi
                typing-extensions         3.10.0.2                 pypi_0    pypi
                werkzeug                  0.16.0                   pypi_0    pypi
                wheel                     0.37.0             pyhd3eb1b0_1
                wrapt                     1.13.2                   pypi_0    pypi
                xz                        5.2.5                h7b6447c_0
                zlib                      1.2.11               h7b6447c_3

# find out what distribution of linux your running

            cat /etc/*release or cat /etc/issue*

            Output
            DISTRIB_ID=Ubuntu
            DISTRIB_RELEASE=18.04
            DISTRIB_CODENAME=bionic
            DISTRIB_DESCRIPTION="Ubuntu 18.04.6 LTS"
            NAME="Ubuntu"
            VERSION="18.04.6 LTS (Bionic Beaver)"
            ID=ubuntu
            ID_LIKE=debian
            PRETTY_NAME="Ubuntu 18.04.6 LTS"
            VERSION_ID="18.04"
            HOME_URL="https://www.ubuntu.com/"
            SUPPORT_URL="https://help.ubuntu.com/"
            BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
            PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
            VERSION_CODENAME=bionic
            UBUNTU_CODENAME=bionic
            cat: or: No such file or directory
            cat: cat: No such file or directory
            Ubuntu 18.04.6 LTS \n \l

# Install VirtualBox on Ubuntu

* Install VirtualBox from Ubuntu Repositories

* update instance

            sudo apt update
            sudo apt upgrade -y

* import and add Oracle public keys repository key to your system

         wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

         Output
         OK
         wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

         Output
         OK

* Add Debian-based Linux distributions to repository

        sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"

        Output
            Hit:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic InRelease
            Get:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
            Get:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]       
            Get:4 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]                         
            Hit:5 https://download.docker.com/linux/ubuntu bionic InRelease                                                          
            Get:6 http://download.virtualbox.org/virtualbox/debian bionic InRelease [4432 B]                                         
            Get:7 http://download.virtualbox.org/virtualbox/debian bionic/contrib amd64 Packages [1899 B]
            Fetched 258 kB in 1s (394 kB/s)     
            Reading package lists... Done

* Downloading virtualbox for Linux last distributions

            wget https://download.c.org/virtualbox/6.1.28/virtualbox-6.1_6.1.28-147628~Ubuntu~bionic_amd64.deb

          Output
            --2021-10-25 09:42:54--  https://download.virtualbox.org/virtualbox/6.1.28/virtualbox-6.1_6.1.28-147628~Ubuntu~bionic_amd64.deb
            Resolving download.virtualbox.org (download.virtualbox.org)... 23.62.16.37
            Connecting to download.virtualbox.org (download.virtualbox.org)|23.62.16.37|:443... connected.
            HTTP request sent, awaiting response... 200 OK
            Length: 93242264 (89M) [text/plain]
            Saving to: ‘virtualbox-6.1_6.1.28-147628~Ubuntu~bionic_amd64.deb’

            virtualbox-6.1_6.1.28-147628~U 100%[==================================================>]  88.92M   104MB/s    in 0.9s    

            2021-10-25 09:42:55 (104 MB/s) - ‘virtualbox-6.1_6.1.28-147628~Ubuntu~bionic_amd64.deb’ saved [93242264/93242264]

*  install VirtualBox 

            sudo dpkg -i virtualbox-6.1_6.1.28-147628~Ubuntu~bionic_amd64.deb

        Output
            Selecting previously unselected package virtualbox-6.1.
            (Reading database ... 91725 files and directories currently installed.)
            Preparing to unpack virtualbox-6.1_6.1.28-147628~Ubuntu~bionic_amd64.deb ...
            Unpacking virtualbox-6.1 (6.1.28-147628~Ubuntu~bionic) ...
            dpkg: dependency problems prevent configuration of virtualbox-6.1:
            virtualbox-6.1 depends on libgl1; however:
            Package libgl1 is not installed.
            virtualbox-6.1 depends on libopus0 (>= 1.1); however:
            Package libopus0 is not installed.
            virtualbox-6.1 depends on libqt5core5a (>= 5.9.0~beta); however:
            Package libqt5core5a:amd64 is not installed.
            virtualbox-6.1 depends on libqt5gui5 (>= 5.4.0); however:
            Package libqt5gui5:amd64 is not installed.
            virtualbox-6.1 depends on libqt5opengl5 (>= 5.0.2); however:
            Package libqt5opengl5 is not installed.
            virtualbox-6.1 depends on libqt5printsupport5 (>= 5.0.2); however:
            Package libqt5printsupport5 is not installed.
            virtualbox-6.1 depends on libqt5widgets5 (>= 5.7.0); however:
            Package libqt5widgets5 is not installed.
            virtualbox-6.1 depends on libqt5x11extras5 (>= 5.6.0); however:
            Package libqt5x11extras5 is not installed.
            virtualbox-6.1 depends on libsdl1.2debian (>= 1.2.11); however:
            Package libsdl1.2debian is not installed.
            virtualbox-6.1 depends on libvpx5 (>= 1.6.0); however:
            Package libvpx5 is not installed.
            virtualbox-6.1 depends on libxcursor1 (>> 1.1.2); however:
            Package libxcursor1 is not installed.
            virtualbox-6.1 depends on libxt6; however:
            Package libxt6 is not installed.

            dpkg: error processing package virtualbox-6.1 (--install):
            dependency problems - leaving unconfigured
            Processing triggers for systemd (237-3ubuntu10.52) ...
            Processing triggers for ureadahead (0.100.0-21) ...
            Processing triggers for mime-support (3.60ubuntu1) ...
            Processing triggers for shared-mime-info (1.9-2) ...
            Errors were encountered while processing:
            virtualbox-6.1


*  Fix install VirtualBox Errors

            sudo apt -f install

        Output
            Reading package lists... Done
            Building dependency tree       
            Reading state information... Done
            Correcting dependencies... Done
            The following additional packages will be installed: ..........

*  Check VirtualBox kernel

            sudo systemctl status vboxdrv

        Output
            ● vboxdrv.service - VirtualBox Linux kernel module
            Loaded: loaded (/usr/lib/virtualbox/vboxdrv.sh; enabled; vendor preset: enabled)
            Active: active (exited) since Mon 2021-10-25 09:56:14 UTC; 18min ago
            Tasks: 0 (limit: 4915)
            CGroup: /system.slice/vboxdrv.service

            Oct 25 09:56:14 ip-172-31-22-124 systemd[1]: Starting VirtualBox Linux kernel module...
            Oct 25 09:56:14 ip-172-31-22-124 vboxdrv.sh[98944]: vboxdrv.sh: Starting VirtualBox services.
            Oct 25 09:56:14 ip-172-31-22-124 systemd[1]: Started VirtualBox Linux kernel module.            

# Install Docker Engine on Ubuntu

* Setup and Configure Docker locally:

https://docs.docker.com/engine/install/ubuntu/

* update instance

          sudo apt update
          sudo apt upgrade -y

* Update the apt package:

          sudo apt-get install \
            apt-transport-https \
            ca-certificates \
            curl \
            gnupg \
            lsb-release -y

* Add Docker’s official GPG key:

           curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

* Use the following command to set up the stable repository

           echo \
                "deb [arch=(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
                (lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

* Install Docker Engine:

           sudo apt-get update
           sudo apt-get install docker-ce docker-ce-cli containerd.io

* Verify Docker version:

            docker version

            Output
            Client: Docker Engine - Community
                                        Version:           20.10.9
                                        API version:       1.41
                                        Go version:        go1.16.8
                                        Git commit:        c2ea9bc
                                        Built:             Mon Oct  4 16:08:29 2021
                                        OS/Arch:           linux/amd64
                                        Context:           default
                                        Experimental:      true

                                        Server: Docker Engine - Community
                                        Engine:
                                        Version:          20.10.9
                                        API version:      1.41 (minimum version 1.12)
                                        Go version:       go1.16.8
                                        Git commit:       79ea9d3
                                        Built:            Mon Oct  4 16:06:37 2021
                                        OS/Arch:          linux/amd64
                                        Experimental:     false
                                        containerd:
                                        Version:          1.4.11
                                        GitCommit:        5b46e404f6b9f661a205e28d59c982d3634148f8
                                        runc:
                                        Version:          1.0.2
                                        GitCommit:        v1.0.2-0-g52b36a2
                                        docker-init:
                                        Version:          0.19.0
                                        GitCommit:        de40ad0

Troubleshooting Docker :

 * Error
            Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/version": dial unix /var/run/docker.sock: connect: permission denied

          sudo chmod 666 /var/run/docker.sock

          sudo addgroup docker

          sudo usermod -aG docker {USER}


* Create Flask app Docker Images:

            . ./run_docker.sh

* Setup and Configure Kubernetes locally:

# Install Kubernetes Engine on Ubuntu

https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

* Download the Amazon EKS vended kubectl binary for your cluster's Kubernetes version from Amazon S3:
* Kubernetes 1.21:

            curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl

* Verify the downloaded binary with the SHA-256 sum for your binary:

            openssl sha1 -sha256 kubectl

* Apply execute permissions to the binary:

            chmod +x ./kubectl

* Copy the binary to a folder in your PATH. If you have already installed a version of kubectl:

            mkdir -p HOME/bin && cp ./kubectl HOME/bin/kubectl && export PATH=PATH:HOME/bin

*  Add the HOME/bin path to your shell initialization file:

           echo 'export PATH=PATH:HOME/bin' >> ~/.bashrc

* Verify kubectl version:

           kubectl version --short --client

           Output
           Client Version: v1.21.2-13+d2965f0db10712

* Create Flask app in Container:

* Run via kubectl:

            . ./run_kubernetes.sh


# Installation minikube

            curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
            sudo install minikube-linux-amd64 /usr/local/bin/minikube


* Start your cluster

            minikube start

             Output
             ubuntu@ip-172-31-27-175:~ minikube start

                😄  minikube v1.23.2 on Ubuntu 20.04
                ✨  Automatically selected the docker driver. Other choices: none, ssh
                👍  Starting control plane node minikube in cluster minikube
                🚜  Pulling base image ...
                💾  Downloading Kubernetes v1.22.2 preload ...
                > preloaded-images-k8s-v13-v1...: 511.69 MiB / 511.69 MiB  100.00% 173.76 M
                > gcr.io/k8s-minikube/kicbase: 355.39 MiB / 355.40 MiB  100.00% 44.06 MiB p
                🔥  Creating docker container (CPUs=2, Memory=3800MB) ...| Installati
                🐳  Preparing Kubernetes v1.22.2 on Docker 20.10.8 ...
                ▪ Generating certificates and keys ...
                ▪ Booting up control plane ...
                ▪ Configuring RBAC rules ...
                🔎  Verifying Kubernetes components...
                ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
                🌟  Enabled addons: default-storageclass, storage-provisioner
                🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

                kubectl cluster-info

                        Output
                        Kubernetes control plane is running at https://192.168.49.2:8443
                        CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

                        To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

                  minikube dashboard

                        Output
                        🔌  Enabling dashboard ...
                        ▪ Using image kubernetesui/dashboard:v2.3.1
                        ▪ Using image kubernetesui/metrics-scraper:v1.0.7
                        🤔  Verifying dashboard health ...
                        🚀  Launching proxy ...
                        🤔  Verifying proxy health ...
                        🎉  Opening http://127.0.0.1:36001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/ in your default browser...
                        👉  http://127.0.0.1:36001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/

                  kubectl get nodes

                        Output
                        NAME       STATUS   ROLES                  AGE   VERSION
                        minikube   Ready    control-plane,master   23m   v1.22.2

                  kubectl config view

                        Output
                        apiVersion: v1
                        clusters:
                        - cluster:
                        certificate-authority: /home/ubuntu/.minikube/ca.crt
                        extensions:
                        - extension:
                                last-update: Tue, 19 Oct 2021 22:01:47 UTC
                                provider: minikube.sigs.k8s.io
                                version: v1.23.2
                        name: cluster_info
                        server: https://192.168.49.2:8443
                        name: minikube
                        contexts:
                        - context:
                        cluster: minikube
                        extensions:
                        - extension:
                                last-update: Tue, 19 Oct 2021 22:01:47 UTC
                                provider: minikube.sigs.k8s.io
                                version: v1.23.2
                        name: context_info
                        namespace: default
                        user: minikube
                        name: minikube
                        current-context: minikube
                        kind: Config
                        preferences: {}
                        users:
                        - name: minikube
                        user:
                        client-certificate: /home/ubuntu/.minikube/profiles/minikube/client.crt
                        client-key: /home/ubuntu/.minikube/profiles/minikube/client.key

#  Test  project code using hadolint
https://github.com/hadolint/hadolint/releases

* Install hadolint

              sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.7.0/hadolint-Linux-x86_64 && sudo chmod +x /bin/hadolint


Verify hadolint

             hadolint --version

             Output
             Haskell Dockerfile Linter 2.7.0-no-git

             hadolint ./Dockerfile

             Output
             ./Dockerfile:14 DL3042 warning: Avoid use of cache directory with pip. Use `pip install --no-cache-dir <package>`

             make lint

                  Output
                  # See local hadolint install instructions:   https://github.com/hadolint/hadolint
                  # This is linter for Dockerfiles
                  hadolint Dockerfile
                  # This is a linter for Python source code linter: https://www.pylint.org/
                  # This should be run from inside a virtualenv
                  pylint --disable=R,C,W1203 app.py

                  ------------------------------------
                  Your code has been rated at 10.00/10

# Using the CircleCI Local CLI

## Installation

            sudo curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh |sudo  bash

            Output
            Starting installation.
            Installing CircleCI CLI v0.1.16122
            Installing to /usr/local/bin
            /usr/local/bin/circleci

* Updating the legacy CLI

            circleci update

            Output
            Already up-to-date.

* Configuring the CLI

            circleci switch

            Output
            You've already updated to the latest CLI. Please see `circleci help` for usage.

* Validate a CircleCI config

            circleci config validate

            Output
            Config file at .circleci/config.yml is valid.

* Configuring the CLI

            circleci setup

            Output
            ? CircleCI API Token ****************************************
            API token has been set.
            ? CircleCI Host https://circleci.com
            CircleCI host has been set.
            Setup complete.
            Your configuration has been saved to /home/ubuntu/.circleci/cli.yml.

            Trying an introspection query on API to verify your setup... Ok.
            Trying to query our API for your profile name... Hello, Abdelrazek Rizk.



## Running `app.py`


1. Standalone:  `python app.py`
- can not run app.py port 80 alone but can run alone in port  > 8000

* config
- Standalon run
- app.py
 app.run(host='0.0.0.0', port=8000, debug=True)

# Docker Prediction:

      1. Run    `. ./run_docker.sh` in terminal

      Output
                * Serving Flask app "app" (lazy loading)
                * Environment: production
                  WARNING: Do not use the development server in a production environment.
                  Use a production WSGI server instead.
                * Debug mode: on
                * Running on http://0.0.0.0:80/ (Press CTRL+C to quit)
                * Restarting with stat
                * Debugger is active!
                * Debugger PIN: 814-369-044
                [2021-10-25 12:08:27,642] INFO in app: JSON payload: 
                {'CHAS': {'0': 0}, 'RM': {'0': 6.575}, 'TAX': {'0': 296.0}, 'PTRATIO': {'0': 15.3}, 'B': {'0': 396.9}, 'LSTAT': {'0': 4.98}}
                [2021-10-25 12:08:27,653] INFO in app: Inference payload DataFrame: 
                  CHAS     RM    TAX  PTRATIO      B  LSTAT
                0     0  6.575  296.0     15.3  396.9   4.98
                [2021-10-25 12:08:27,661] INFO in app: Scaling Payload: 
                  CHAS     RM    TAX  PTRATIO      B  LSTAT
                0     0  6.575  296.0     15.3  396.9   4.98
                [2021-10-25 12:08:27,664] INFO in app: Prediction: [20.35373177134412]
                172.17.0.1 - - [25/Oct/2021 12:08:27] "POST /predict HTTP/1.1" 200 -
                [2021-10-25 12:08:30,506] INFO in app: JSON payload: 
                {'CHAS': {'0': 0}, 'RM': {'0': 6.575}, 'TAX': {'0': 296.0}, 'PTRATIO': {'0': 15.3}, 'B': {'0': 396.9}, 'LSTAT': {'0': 4.98}}
                [2021-10-25 12:08:30,515] INFO in app: Inference payload DataFrame: 
                  CHAS     RM    TAX  PTRATIO      B  LSTAT
                0     0  6.575  296.0     15.3  396.9   4.98
                [2021-10-25 12:08:30,523] INFO in app: Scaling Payload: 
                  CHAS     RM    TAX  PTRATIO      B  LSTAT
                0     0  6.575  296.0     15.3  396.9   4.98
                [2021-10-25 12:08:30,526] INFO in app: Prediction: [20.35373177134412]
                172.17.0.1 - - [25/Oct/2021 12:08:30] "POST /predict HTTP/1.1" 200 -


      2. Run    `. ./make_prediction.sh` in other terminal

      Output
                  Port: 8000
                  host: 0.0.0.0
                  {
                    "prediction": [
                      20.35373177134412
                    ]
                  }

* config 
- make_prediction.sh
PORT=8000
localhost=0.0.0.0

* config
- app.py
 app.run(host='0.0.0.0', port=80, debug=True)


# Kubernetes Prediction:

      1. Run   `. ./run_kubernetes.sh` in terminal
      
      Output
                  * Serving Flask app "app" (lazy loading)
                  * Environment: production
                    WARNING: Do not use the development server in a production environment.
                    Use a production WSGI server instead.
                  * Debug mode: on
                  * Running on http://0.0.0.0:80/ (Press CTRL+C to quit)
                  * Restarting with stat
                  * Debugger is active!
                  * Debugger PIN: 931-826-802
                  [2021-10-27 13:34:58,867] INFO in app: JSON payload:  
                  {'CHAS': {'0': 0}, 'RM': {'0': 6.575}, 'TAX': {'0': 296.0}, 'PTRATIO': {'0': 15.3}, 'B': {'0': 396.9}, 'LSTAT': {'0': 4.98}}
                  [2021-10-27 13:05:47,201] INFO in app: Inference payload DataFrame: 
                    CHAS     RM    TAX  PTRATIO      B  LSTAT
                  0     0  6.575  296.0     15.3  396.9   4.98
                  [2021-10-27 13:05:47,209] INFO in app: Scaling Payload: 
                    CHAS     RM    TAX  PTRATIO      B  LSTAT
                  0     0  6.575  296.0     15.3  396.9   4.98
                  [2021-10-27 13:05:47,212] INFO in app: Prediction: [20.35373177134412]
                  127.0.0.1 - - [27/Oct/2021 13:05:47] "POST /predict HTTP/1.1" 200 -
                  [2021-10-27 13:05:48,749] INFO in app: JSON payload: 
                  {'CHAS': {'0': 0}, 'RM': {'0': 6.575}, 'TAX': {'0': 296.0}, 'PTRATIO': {'0': 15.3}, 'B': {'0': 396.9}, 'LSTAT': {'0': 4.98}}
                  [2021-10-27 13:05:48,758] INFO in app: Inference payload DataFrame: 
                    CHAS     RM    TAX  PTRATIO      B  LSTAT
                  0     0  6.575  296.0     15.3  396.9   4.98
                  [2021-10-27 13:05:48,765] INFO in app: Scaling Payload: 
                    CHAS     RM    TAX  PTRATIO      B  LSTAT
                  0     0  6.575  296.0     15.3  396.9   4.98
                  [2021-10-27 13:05:48,767] INFO in app: Prediction: [20.35373177134412]
                  127.0.0.1 - - [27/Oct/2021 13:05:48] "POST /predict HTTP/1.1" 200 -
                  
      2. Run    `. ./make_prediction.sh` in other terminal

      Output
                  Port: 8000
                  host: 0.0.0.0
                  {
                    "prediction": [
                      20.35373177134412
                    ]
                  }                  
 

* config
- make_prediction.sh

PORT=8000
localhost=0.0.0.0

* config
- run_kubernetes.sh
PORT=8000

* config
- app.py
app.run(host='0.0.0.0', port=80, debug=True)

