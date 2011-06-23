deordinalize
============

A small gem to 'deordinalize' strings into the integers they reference.

Installation:
-------------

`gem install deordinalize` and require it. `String` now has the `deordinalize` method.

Usage:
------

**deordinalize**, for the time being, only supports ordinals from 1 to 100.

We can deordinalize numeric ordinals:

	'1st'  # => 1
	'11th' # => 11
	'99th' # => 99
	
Or we can deordinalize more verbose ordinals:

	'first'.deordinalize        # => 1
	'eleventh'.deordinalize     # => 11
	'ninety-ninth'.deordinalize # => 99

This is meant to be hella useful in cucumber steps, like:

	When /^I click on the (.+) item in the list$/ do |ordinal|
		page.find( :xpath, "//li[ordinal.deordinalize - 1]" ).click
	end