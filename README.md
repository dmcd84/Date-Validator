# Date Checker Tech Test

Thank you for giving me the opportunity to attempt this task. I have tried to describe my thinking and decisions made in forming my solution.

## Assumptions

Based on the sample data given, the first and main assumption made, is that an item cannot have two prices for the same customer at the same time. Therefore, the second assumption made is that the newer price will effectively overwrite the older price.


## Approach

The theory:

Take first row of table. Using this as the base for the query, iterate through each of the other rows to determine if any of the other rows have matching fields for product, customer and measure. If this is the case, the date ranges are then compared. If the date ranges of matching records overlap, the first record has the 'valid to' date set to the day before the 'valid from' date of the second record. This decision was taken based on the assumptions made above.

The practical:

Some time was spent spiking queries to the database and drilling down into the data to pull out the information needed for comparison. This was then deleted and code written and committed in a TDD way.

The decision was made to allow data input (i.e. of sample data) to be separate from the program itself. This was so that the program could be tested but allow for the program to be used with other data as directed in the instructions given. Once this had been completed, a third file was created purely for user convenience, so that once all of the setup had been completed, only one command had to be executed to run the check rather than typing multiple commands, in a specific order.  


## Installation and Usage

### If you **don't** already have Postgresql installed:

~ install prostgresql:
`brew install postgresql`

~ Follow the instructions given!

~ Then run the following commands after installation:

`ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents`

then

`launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`


### If you **have Postgresql installed**:

~ From the directory where you have this repo, load postgresql using the command `psql`.

~ Before using this repo, you should create the database using:

`create database ex_tech_test_date_validator`

~ Psql can be exited by typing `\q`

**Uploading sample data, running tests and the program**

~ Upload the same data : `ruby sample_data_input.rb`

~ Run the tests : `rspec`

~ Run the Date Validator for the sample data : `ruby run_check.rb`

### Comments

Although this solution works for data that is correctly formatted, I was unable to deal with edge case of open ended dates. My best guess is that there may be some addition to the model schema to allow non-standard date format, but I was not able to find the solution. Sadly, it is therefore not fully complete.
