#!/bin/bash

if [ "$DEPLOYMENT_GROUP_NAME" == "wsr-frontend-prod1" ]
then
    if [ -e /home/my-temp-dir/.env ]
    then
        echo "Waiting for 2 minutes...."
        sleep 120
        cp -R /home/my-temp-dir/. /home/ubuntu/upload
        sudo rm -rf /home/my-temp-dir
        chown -R ubuntu:ubuntu /home/ubuntu/upload
        cd /home/ubuntu/upload
        npm install

        # Run npm build and check its exit code
        npm run build
        cp -r build * /var/www/html

        if [ $? -eq 0 ]
        then
            sudo apt-get update
        else
            echo "Error: npm run build failed."
        fi
    else
        cp -R /home/my-temp-dir/. /home/ubuntu/upload
        sudo rm -rf /home/my-temp-dir
        chown -R ubuntu:ubuntu /home/ubuntu/upload
        cd /home/ubuntu/upload
        npm install

        # Run npm build and check its exit code
        npm run build
        cp -r build * /var/www/html

        if [ $? -eq 0 ]
        then
            sudo apt-get update
        else
            echo "Error: npm run build failed."
        fi
    fi
fi
