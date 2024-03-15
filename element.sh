#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# if no argument is given
if [[ ! $1 ]]
then
  echo -e "Please provide an element as an argument."
# else if first argument is an integer
  exit
elif [[ $1 =~ ^[0-9]+$ ]]
then
  # check by the atomic number
  ELEMENT_RESULT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
else
  ELEMENT_RESULT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol ILIKE '$1' OR name ILIKE '$1'")
  # if not, check by the symbol or element name
fi

# if the element exists
echo $ELEMENT_RESULT

