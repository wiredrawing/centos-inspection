#! /bin/bash


cp -R /var/www/pre/app /var/www/html/

cd /var/www/html/app/

rails s --binding=0.0.0.0
