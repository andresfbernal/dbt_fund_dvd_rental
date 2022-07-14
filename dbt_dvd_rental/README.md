# Build a dimensional model using DBT

# Content table

1. [Context](#context)
2. [Learning Objectives](#Learning-objectives)
3. [Instructions](#Instructions)


In this project, you are going to install the DBT Client into your local machine. Then, you will use it to create a dimensional model. To do so, you are going to use an AWS RDS Postgres database.

# Context
You will be working with data collected in a DVD RENTAL store. In the database you will find information about the stores, customers and rented films.

The following is the ERD (Entity Relationship Diagram) for the database you'll be using.

<p align="center">
  <img width="" height="" src="./images/dvd-rental-sample-database-diagram.png">
</p>

Here's a brief context about the tables:

Tables
- `Actor`: Contain actors names and relational ID
- `Address`: Contains data about addresses and cities
- `Category`: Contains data about the category of the film
- `City`: This table has the data related to the cities and relational ids
- `Country`: Has the name of the countries and the relational ID's
- `Customer`: Contains the data related to the customer, like name, stores where they bought and if is active.
- `Film`: Has the information about the film, like the title, description, language and raitings.
- `Film_actor`: Stores the relation between the film and the actor
- `Film_category`: has the relation between the film and its category.
- `Inventory`: Stores the relation between the film and its inventory.
- `Language`: Has the language ID and the name for relations with other tables.
- `Payment`: has data related to the payment including the customer, staff, the amounts and dates.
- `Rental`: Contains the data for the rental of a dvd and the customer of the transaction.
- `Staff`: Staff means the group of people that work in the store
- `Store`: contains the data related to the store like the manager and address.


# Learning objectives
* Design a dimensional model by following Kimball's data modeling technique
* Create a DBT project and configure it
* Get familiar with DBT models, documentation api, and tests

# Instructions
* Install DBT in your local machine [[1](https://docs.getdbt.com/dbt-cli/install/overview)]
* Ask for credentials of the AWS RDS database
* Create a DBT project and configure access to RDS database [[2](https://docs.getdbt.com/docs/building-a-dbt-project/projects)]
* Build a dimensional model using DBT models that allows different areas of a DVD rental company to execute their tasks and extract insights from the information that is being delivered. As a starting point, build the needed models to answer the following questions:
- What are the top and least rented genres and what are their total sales?
- What is the performance of each store in terms of rents and earnings?
- What is the potential loss of not getting back the movies rented?
- Who were the top customers in terms of rents and lifetime value?
- Which are the profiles of the top consumers in terms of rents and lifetime value (Is up to you, what a top consumer can be)?
- How many rented films were returned late, early, and on time?
- What are the films with the lowest rents and why could this be?
Make sure to structure your DBT projects by following the modular data modeling technique to do so. Set up a local materialization for this project using postgres. [[3](https://www.getdbt.com/analytics-engineering/modular-data-modeling-technique/), [4](https://docs.getdbt.com/docs/building-a-dbt-project/building-models)]
* Implement some basic tests for the DBT models [[5](https://docs.getdbt.com/docs/building-a-dbt-project/tests)]
* Document your dimensional model using DBT documentation API [[6](https://docs.getdbt.com/docs/building-a-dbt-project/documentation)]
* Build a small presentation where you can explain why and how you build the dimensional model. 