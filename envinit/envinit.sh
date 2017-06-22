#!/bin/sh
answer=0
while [ "$answer" -eq "0" ]; do
    echo -n "Enter environment name [tamaranga]: "
    read project_name
    if [ -z $project_name ]; then
        project_name="tamaranga"
    fi

    echo -n "Enter document root path: "
    read php_webroot

    while [ -z $php_webroot ]; do
        echo -n "Document root is invalid. Enter document root path: "
        read php_webroot
    done

    echo -n "Enter mysql user name: "
    read mysql_user

    while [ -z $mysql_user ]; do
        echo -n "Username is invalid. Enter mysql user name: "
        read mysql_user
    done

    echo -n "Enter mysql user password: "
    read -s mysql_user_pass

    echo

    echo -n "Repeat mysql user password: "
    read -s mysql_user_pass_check

    echo

    while [ "$mysql_user_pass" != "$mysql_user_pass_check" ] || [ -z $mysql_user_pass ]; do
        echo "Passwords did not match. Try again: "

        echo -n "Enter mysql user password: "
        read -s mysql_user_pass

        echo

        echo -n "Repeat mysql user password: "
        read -s mysql_user_pass_check
    done

    echo

    echo -n "Enter mysql root password: "
    read -s mysql_root_pass

    echo    

    echo -n "Repeat mysql root password: "
    read -s mysql_root_pass_check

    echo

    while [ "$mysql_root_pass" != "$mysql_root_pass_check" ] || [ -z $mysql_root_pass ]; do
        echo "Passwords did not match. Try again: "
        
        echo -n "Enter mysql root password: "
        read -s mysql_root_pass

        echo

        echo -n "Repeat mysql root password: "
        read -s mysql_root_pass_check
    done

    echo

    echo -n "Enter mail host [mail]: "
    read mail_host

    echo -n "Enter mail domain [example.com]: "
    read mail_domain

    echo -n "Enter mail senders [domain1.com domain2.com]: "
    read mail_senders

    echo -n "Enter cert country [US]: "
    read -n 2 cert_country

    echo -n "Enter cert state [NY]: "
    read cert_state

    echo -n "Enter cert city [NEW YORK]: "
    read cert_city

    echo -n "Enter cert company [EXAMPLE]: "
    read cert_company

    echo

    echo "PROJECT_NAME=$project_name"
    echo "PHP_WEBROOT=$php_webroot"
    echo "MAIL_HOST=$mail_host"
    echo "MAIL_DOMAIN=$mail_domain"
    echo "MAIL_SENDERS=$mail_senders"
    echo "CERT_COUNTRY=$cert_country"
    echo "CERT_STATE=$cert_state"
    echo "CERT_CITY=$cert_city"
    echo "CERT_COMPANY=$cert_company"
    echo "MYSQL_USER=$mysql_user"
    echo "MYSQL_USER_PASS=******"
    echo "MYSQL_ROOT_PASS=******"

    echo -n "Is this information correct? [Y/N]: "
    read answer

    if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
        answer=1

        echo "PROJECT_NAME=$project_name" > .env
        echo "PHP_WEBROOT=$php_webroot" >> .env
        echo "MAIL_HOST=$mail_host" >> .env
        echo "MAIL_DOMAIN=$mail_domain" >> .env
        echo "MAIL_SENDERS=$mail_senders" >> .env
        echo "CERT_COUNTRY=$cert_country" >> .env
        echo "CERT_STATE=$cert_state" >> .env
        echo "CERT_CITY=$cert_city" >> .env
        echo "CERT_COMPANY=$cert_company" >> .env
        echo "MYSQL_USER=$mysql_user" >> .env
        echo "MYSQL_USER_PASS=$mysql_user_pass" >> .env
        echo "MYSQL_ROOT_PASS=$mysql_root_pass" >> .env
    else   
        answer=0
    fi
done