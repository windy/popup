Popup
===========

Are you using watir for TA(testingautomation) ?
Do you test with complicat codes ?
Yes, Popup is designed for you.
It can do all type of popups, and is complicat with different windows platfrom, XP,2003,vista,win7 (en and chinese version)
It also has a very simple interface.

Requirements
------------
* Ruby

Compatibility
-------------
Ruby1.8.6
Ruby1.8.7
Ruby1.9.2

support XP,2003,vista,win7( If not work, please tell me, I will fix it immediately )


Installation
------------
  gem install popup

Usage
-----
    require 'rubygems'
    require 'popup'
    ATT::AlertPopup.find_when { button.click }.click
----------------------

How to test
----
1. run spec/*.spec:
    rspec .

How to push my fix code
--------

* fork it
* read the code and modify it and commit
* add spec test.( important, if there is no testing, I will reject your push request. )
* Then push your request.