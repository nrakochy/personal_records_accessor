#Personal Records Accessor
This is a vanilla Ruby app + the Grape micro-framework to 1) read in text files from the command line, 2) save to a db,
3) and expose Rest-like API endpoints when it is racked up.

##Command Line
To process text files from the command line, enter the executable method in the bin + text files. There are two text
files that can be used in the support directory. For example:
```
bin/start_console_personal_records_accessor support/sample_file.txt support/sample_file2.txt
```
This will read the contents of the files, save them as a single JSON file, and display the records in 3 outputs to the
console. Here are the outputs:
```
Output 1 – sorted by gender (females before males) then by last name ascending.
Output 2 – sorted by birth date, ascending.
Output 3 – sorted by last name, descending.
```
##API
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
last_name | first_name | gender | favorite_color | date_of_birth
```
To make the POST request from the command line, you need to specify content type as json.
Use this format (but see Server for localhost information which will change the request call):

```
curl -X POST 0:5000/records -d '{"record": "lastName firstName female red 01/01/2001"}' -H "Content-Type:application/json"
```
##Server
This app uses Puma as a server which is configured in config/puma.rb. The localhost port will vary by service. Foreman uses
port 5000 by default (as in the POST example above), Rack has port 9292 by default, and this Puma server will set the port to
3000 if it is not set in the ENV[‘PORT’] variable.

##Tests
This project uses Rspec. `Rspec spec` or `bundle exec rake` should give you green all the way.


