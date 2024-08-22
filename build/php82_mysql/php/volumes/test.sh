#!/bin/bash

cd /var/www/exment

#Check return value

I=0
while [ $I -lt 10 ]; do
    /usr/local/bin/php artisan exment:check-connection
    if [ $? -eq 1 ]; then
        /usr/local/bin/php artisan exment:inittest --yes >> ./storage/logs/inittest.log
    
        ./vendor/bin/phpunit ./vendor/exceedone/exment/tests/Browser >> ./storage/logs/test.log
        ./vendor/bin/phpunit ./vendor/exceedone/exment/tests/Unit >> ./storage/logs/test.log
        ./vendor/bin/phpunit ./vendor/exceedone/exment/tests/Feature >> ./storage/logs/test.log
        ./vendor/bin/phpstan analyse >> ./storage/logs/test.log
        exit
    fi
    I=`expr $I + 1`
    sleep 10
done