# Intro

This project is a working Cucumber + Watir-WebDriver framework using the page-object gem.

This is similar to the [page](https://github.com/alisterscott/WatirMelonCucumber) from Alister Scott's WatirMelonCucumber,
but it uses the page-object gem.

# Features
It uses Watir-webdriver for driving the browser tests, and uses Cucumber for specs...not too interesting. However, I've also added the use of the page-object gem
# Install
Run bundle install to get the appropriate gems

# Things to note
I'm using a few gems to help me out:

page-object - adds the page abstraction layer so we can decouple any changes to the page with our steps definitions.
page-object/page-factory - gives us the ability to call method on different pages.
data_magic - gives the ability to load a YAML file and populate the page object's fields.
rspec-expectation - adds some syntactic sugar on objects so they can be validated against using a human readable DSL.

Note the @current tag in the feature...this helps in development mode when you are working on 1 test at a time. Just run 'cucumber --tags @current' to run that 'current' test.

Also note that in hooks.rb, there is an After blocks that will take a screenshot of the current page if the scenario has failed.

We also have a Common.rb that serves as a module which will read in values from a YAML file (happens to be the same YAML file as the one used for the test data, but doesn't necessarily have to be that way).

# Caveats
In the current version of the page-object gem, there is a big nasty message that gets spit out if you use the watir Element methods (such as element_wait_until_present). I believe this is a bug and has been submitted on the creator's Github issue site. In my opinion it's perfectly find to delegate to Watir's method if it doesn't happen to have it on the Element.