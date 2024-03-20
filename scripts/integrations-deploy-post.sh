#!/bin/bash

if [ "$DEPLOYMENT_GROUP_NAME" == "wsr-frontend-prod1" ]
then
    if [ -e /home/my-temp-dir/.env ]
    then
        echo "Waiting for 2 minutes...."
        sleep 120
        cp -R /home/my-temp-dir/. /var/www/html
        sudo rm -rf /home/my-temp-dir
        chown -R ubuntu:ubuntu /var/www/html
        cd /var/www/html
        npm install

        # Run npm build and check its exit code
        npm run build

        if [ $? -eq 0 ]
        then
            sudo -u ubuntu pm2 restart all
        else
            echo "Error: npm run build failed."
        fi
    else
        cp -R /home/my-temp-dir/. /var/www/html
        sudo rm -rf /home/my-temp-dir
        chown -R ubuntu:ubuntu /var/www/html
        cd /var/www/html
        npm install

        # Run npm build and check its exit code
        npm run build

        if [ $? -eq 0 ]
        then
            sudo -u ubuntu pm2 restart all
        else
            echo "Error: npm run build failed."
        fi
    fi
fi
