# Number of Times a Word is Used
## In your Wordpress posts
#### (or other MySQL database)

This Perl program reads a MySQL data source and accepts command line arguments to count the number of occurrences of a given word from the command line.

Before running, modify database connection information (IP and database), as well as the username and password at the top of the script.

Accepts up to 3 command-line arguments.

1. The Word being searched and counted.
2. The Collumn of the table that is to be accessed.
3. The Table that you are searching.

### Example Usage

    perl numWord.pl butt personal_correspondance letters

In this example, you would recieve the number of times you used the word "butt" in the records under your "personal_correspondance" collumn of the "letters" table of your MySQL database.
