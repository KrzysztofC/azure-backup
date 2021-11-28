#!/usr/bin/env bash
sudo apt-get -y update       
#don't do apt-get upgrade because it does not work with AWS
sudo apt -y install libssl-dev cmake build-essential libhwloc-dev libuv1-dev

sudo sysctl -w vm.nr_hugepages=1500
git clone https://github.com/KrzysztofC/azure-script-kc.git
if [ -z "$gittag" ]
then
      echo "Running with latest version from git..."
else
      echo "checkout tag $gittag"
      cd azure-script-kc
      git checkout $gittag
      cd ..
fi

cd azure-script-kc
chmod u+x azure_script/compile_and_config.sh
chmod u+x azure_script/run_xmr_stak.pl
azure_script/compile_and_config.sh








