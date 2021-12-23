#!/bin/sh

BACKUP=/data/Backup/Kubuntu_21.10
DAY=$(date +%u)

if [ "$DAY" = "7" ]; then
    NUM="0"
    rm -rf $BACKUP/Kubuntu_21.10.snar
    rm -rf $BACKUP/*.tgz
else
    NUM="$DAY"
fi
cd /home/alse61 && \
tar --create \
    --gzip \
    --file=$BACKUP/Kubuntu_21.10.$NUM.tgz \
    --one-file-system \
    --exclude=*.tmp \
    --exclude=.cache \
    --ignore-failed-read \
    -v \
        /home/alse61
if [ ! -e smb://mir3.mir3/Main/Backup/APPs/Kubuntu_21.10.$NUM.tgz ]; then
scp $BACKUP/Kubuntu_21.10.$NUM.tgz alse61@192.168.1.1:/media/Main/Backup/Kubuntu_21.10.$NUM.tgz
else
echo "Don't copy to SMB Share MIR3!"
fi
