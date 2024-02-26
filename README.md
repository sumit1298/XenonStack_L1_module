# College Database SQL Queries

This repository contains SQL scripts and data import instructions for implementing SQL queries on a PostgreSQL database containing college-type data.

## Overview

The assignment focuses on:

- Importing flat files into PostgreSQL.
- Creating tables with appropriate fields based on the given schema.
- Implementing SQL queries to retrieve specific information from the database.

## Files

- `createtable.sql`: SQL script for creating tables with appropriate fields based on the given schema.
- `queries.sql`: SQL queries designed to answer specific questions about the college database.
- `data/`: Directory containing flat files for importing data into PostgreSQL.

## Instructions

1. **Data Import Process:**
   - Create a new directory for this assignment.
   - Copy all the data files into your new directory.
   - Execute the `createtable.sql` script to create tables in PostgreSQL.
   - Import the flat files one-by-one to the tables using `\copy` command in PostgreSQL command line tool.

2. **Executing Queries:**
   - Run the SQL queries provided in `queries.sql` using PostgreSQL.
   - Verify the query results to ensure they meet the requirements of the assignment.

## Usage

1. Clone the repository:

