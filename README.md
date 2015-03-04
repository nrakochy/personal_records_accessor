## Command Line
To process text files from the command line, enter the executable method in the bin + text files. For example:
```
bin/start_console_personal_records_accessor filename1 filename2
```
There are two sample text files that can be used in the support directory if needed. This will read
the file and display the records to the console like so:
```
Output 1 – sorted by gender (females before males) then by last name ascending.
Output 2 – sorted by birth date, ascending.
Output 3 – sorted by last name, descending.
```
## Api
This app uses the [Grape Api](http://intridea.github.io/grape/), which is a “an opinionated micro-framework
for creating REST-like APIs in Ruby.”

For this project, you can use the following HTTP requests:

```
POST /records - Post a single data line in any of the 3 supported formats
GET /records/gender - returns records sorted by gender
GET /records/birthdate - returns records sorted by birthdate
GET /records/name - returns records sorted by name
```
This can post a single command-delimited, space-delimited, or pipe-delimited line to save to the db,
with these fields:
```
last_name first_name gender favorite_color date_of_birth
```
To make the POST request from the command line, you need to specify content type as json.
Use this format:

```
curl -X POST 0:5000/records -d '{"record": "lastName firstName female red 01/01/2001"}' -H "Content-Type:application/json"
```


## Tests
Using Rspec to TDD. `Rspec spec` or `bundle exec rake` should give you green all the way.


