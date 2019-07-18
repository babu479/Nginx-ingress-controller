#!/bin/bash

podcpu=0
TODAY=`date +%F`
KUBECTL=/usr/local/bin/kubectl
SCRIPT_HOME=/var/log/kube-deploy
if [ ! -d $SCRIPT_HOME ]; then
  mkdir -p $SCRIPT_HOME
fi
#LOG_FILE=$SCRIPT_HOME/kube-$TODAY.log
#touch $LOG_FILE
RED='\033[01;31m'
YELLOW='\033[0;33m'
NONE='\033[00m'

print_help(){
  echo -e "${YELLOW}Use the following Command:"
  echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo -e "${RED}./<script-name> --action <action-name> --deployment <deployment-name> --scaleup <scaleupthreshold> --scaledown <scaledownthreshold>"
  echo -e "${YELLOW}+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  printf "Choose one of the available actions below:\n"
  printf " prerequisities-install\n kops-install\n kubectl-install\n aws_cli\n aws-configure\n aws-s3configure\n Kops-cluster-creation\n "
  echo -e "You can get the list of existing deployments using command: kubectl get deployments${NONE}"
}
ARG="$#"
if [[ $ARG -eq 0 ]]; then
  print_help
  exit
fi
while test -n "$1"; do
   case "$1" in

        --action)
            ACTION=$2
            shift
            ;;
       *)
            print_help
            exit
            ;;
   esac
    shift
done
echo $ACTION
echo $ARG

prerequisities_install(){
if [ ! -z "$ACTION" ]
then
echo "Here we are installing prerequisites like "
echo "python\n pip install\n "
apt-get update
apt-get install python-pip -y
fi
}


if [ "$ACTION" = "prerequisities-install" ];then
if [ $ARG -ne 2 ]
      then
        echo "Incorrect No. of Arguments Provided"
        print_help
        exit 1
      fi
echo  "running"
echo "$ACTION"
    prerequisities_install
fi
