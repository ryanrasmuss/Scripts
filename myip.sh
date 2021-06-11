#!/bin/bash


server1="$(curl -s ipecho.net/plain)" 
server2="$(curl -s icanhazip.com)"

echo $server1
echo $server2

country="$(curl -s https://ipapi.co/$server2/country/)"
region="$(curl -s https://ipapi.co/$server2/region/)"

#echo -e "\033[95m$country\033[0m"
#echo -e "\033[95m$region\033[0m"


get_country () 
{
   
   case $country in

       US)
          echo -e "\033[95m$country\033[0m 🇺🇸"
          ;;

       UA)
          echo -e "\033[1;93;44m$country\033[0m 🇺🇦"
          ;;

        
       *)
          echo -n "unknown"
          ;;

   esac

}


get_country
echo -e "\033[95m$region\033[0m"
