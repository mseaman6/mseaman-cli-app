# Specifications for the CLI Assessment

Specs:
- [X] Have a CLI for interfacing with the application
      -There is a CLI class that allows the user to input their selections and receive coordinating responses.
- [X] Pull data from an external source
      -The Event_Scraper class scrapes data from the DC Public Libary page, both the event listing info (name, date, url) and the lower-level description info that is procured from the scraped url
- [X] Implement both list and detail views
      -A list view is available when the user selects "events".  Then the user will see a event list displayed.  A detail view is provided when the user selects an item from the event list.
