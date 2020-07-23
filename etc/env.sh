#!/bin/bash
CHANGE_SOURCE=true
APP_CODE_PATH_HOST=./html
APP_CODE_PATH_CONTAINER=/var/www/html

INSTALL_BLACKFIRE=false

NETWORKS_DRIVER=bridge

etc_path="${root}/etc"
for file in `ls "${etc_path}"/*_env.sh`;do
    . ${file}
done
