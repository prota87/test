#!/bin/bash

if [ -f /etc/os-release ]; then
    source /etc/os-release
	print "${ID}","${PRETTY_NAME}"
else
    exit 1
fi

case ${ID} in
    astra )            wget --quiet https://github.com/prota87/test/blob/main/astra.sh  -O /tmp/$$_install.sh
                        ;;
    redos )            wget --quiet https://github.com/prota87/test/blob/main/astra.sh -O /tmp/$$_install.sh 
                        ;;
    * )                 echo "Can\'t detect OS. Please check the /etc/os-release file.'"
                        exit 1
esac

bash /tmp/$$_install.sh $@
rm /tmp/$$_install.sh

