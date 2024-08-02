# EDA-for-Global-Electronics
DATA CLEANING:(using pandas)
      -At first to convert every file to a dataframe.
      -Next to find the null values and handle it by each file.
      -Next is to find the datatype of the given data and change it according to our needs(eg:changing the dates from string to datetime format).
LOADING THE DATA TO SQL:
      -The tools used were psycopg2 and sqlaclhemy.
      -First create a Database.
      -In addition to that create schemas for all the tables and push each(customers, exchange_rates, products, sales and stores) into the database.

Now as we pushed all the cleaned data to the database the next thing to do is with the help of powerBi we need to visualize the data.

VISUALIZING THE DATA(using powerBi):
        -There are several query based on the data that we're given with.
            For eg:
                >Queries based on profits based on "Brand".
                >Queries based on  interest on products based on "Age".
                >Queries based on "Product" profit.and etc....


The key take aways form the analyzed data is given in the Power point.
      
