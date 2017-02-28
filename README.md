# URLockBox
URLockBox is an app that allows users to manage links.  It interacts with a downstream system [HotReads](https://serene-shore-26911.herokuapp.com/).  These apps were written in 12 hours

[Production](https://desolate-coast-51234.herokuapp.com/)

## Installation

1. Clone the repository: `git clone https://github.com/mscherer11/final-urlockbox`
2. Bundle `bundle install`
3. Start Rails server: `rails s`

## Testing
Testing is conducted via RSpec and can be triggered by running `rspec` in the terminal.  It has been configured with the poltergiest gem to run the phantomjs webdriver via `js: true` in Capybara tests.

## Technology
* Server: Rails -> 5.0.0
* Client-side: ERB/HTML, JavaScript
* Database: PostgreSQL
* Libraries: jQuery

## Author
[Michael Scherer](https://github.com/mscherer11)

## Tutorial
### Sign-up
1. Navigate to the [root page](https://desolate-coast-51234.herokuapp.com/)
2. Click [Sign Up](https://desolate-coast-51234.herokuapp.com/signup?)

*Result: Taken to the main page with an option to create links*

### Adding Links
1. Add a title in the "Title:" box
2. Add a url in the "Url:" box
3. Click "Add link" button

*Result: Link should be added to the table below*

### Filtering
* Type in "By Text:" box

*Result:* Table should dynamically generate based off keypress

* Click "Only Unread Links"

*Result:* Table should show only those results that are unread

* Click "Only Read Links"

*Result:* Table should show only those results that are read

### Mark Read
On a single result:
  1. Click "Mark as Read"
  2. Navigate to [HotReads](https://serene-shore-26911.herokuapp.com/)

*Result: If that link has been read enough within the last 24 hours, it will be shown on the Hot Reads list, with the number of times it has been read. __On URLockbox__, the card will be greyed out.*

## Edit Link
On a single result:
  1. Click "Edit"
  2. Edit Title
  3. Edit Url

*Result: Changes will be persisted without refresh*

**Delete does not currently work but has been left as part of the assessment skeleton**
