##!/usr/bin/env bash
ssh-agent bash -c 'ssh-add ~/.ssh/github; git clone git@github.com:artplastika/MyWedDocker.git tmp'
rm -rf tmp/.git tmp/.gitignore tmp/bootstrap.sh
mv -f tmp/* .
rm -rf tmp
ssh-agent bash -c 'ssh-add ~/.ssh/github; git clone -b dev --single-branch git@github.com:MyWed/MyWed.git source/MyWed'
mkdir ./source/MyWed/cache ./source/MyWed/logs
echo "personal" > ./source/MyWed/application/configs/env.ini
bash -c 'ssh-add ~/.ssh/github; git clone -b dev --single-branch git@github.com:MyWed/MyWedApi.git source/MyWedApi'
sudo sh -c "echo '127.0.0.1 mywed.lc api.mywed.lc' >> /etc/hosts"
./mywed.sh setup "$1"
