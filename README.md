# Joins And Union
## This explains how to perform JOIN and UNION operations between the Country and Persons tables.

### Country Table:
Contains information about countries, including:

`Id`: Country identifier (Primary Key).

`Country_name`: Name of the country.

`Population`: Population of the country.

`Area`: Total area of the country in square kilometers.

### Persons Table:
Contains information about individuals, including:

`Id`: Person's identifier (Primary Key).

`Fname`: First name of the person.

`Lname`: Last name of the person.

`Population`: Population of the person (in a specific region).

`Rating`: Rating given to the person (a floating-point number).

`Country_Id`: Foreign key that links to Id in the Country table.

`Country_name`: The name of the country, stored for convenience.
