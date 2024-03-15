#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

# if no argument is given
if [[ ! $1 ]]
then
  echo -e "Please provide an element as an argument."
elif [[ $1 =~ ^[0-9]+$ ]]
  # if first argument is an integer
then
  echo true
  # look for check by the atomic number
else
  echo false
  # if not, check by the symbol or element name
fi
  


