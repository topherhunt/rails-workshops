# Module 01: Intro to Ruby and Rails

This module will introduce you to all the basic concepts in Rails web development.


## Requirements

  * If you aren't familiar with how web servers / HTTP / the internet works, skim this article (pages 1 - 7): https://computer.howstuffworks.com/web-server.htm

  * If you aren't familiar with HTML, skim this article: https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/Getting_started

  * We'll write Ruby code during this workshop. You don't need to learn Ruby beforehand, but skim through https://www.vikingcodeschool.com/professional-development-with-ruby/ruby-cheat-sheet so that you can at least recognize some of the common patterns in how Ruby is written.

  * No Rails experience is required.

  * IMPORTANT: At least **2 days** before the workshop: Make sure your Vagrant environment is installed and working properly by carefully following [these setup steps](/help/working_with_vagrant.md). **If you don't have Vagrant set up properly, you can't participate in the workshop!** If you run into trouble, please email me (hunt DOT topher AT gmail DOT com) and I'll gladly help you out.

  * Make sure you have a decent code editor. Almost any plain-text editor will work. My favorites are [Sublime Text](https://www.sublimetext.com) or [VS Code](https://code.visualstudio.com). Both are free.


## Presentation part 1

TODO: link to the slides.

Will cover:

  - about me
  - what is Ruby, what is Rails
  - why learn Rails
  - goals for today
  - Today's exercise: whirlwind wour through a simple Rails app


## Exercise: Build a simple Rails app (whirlwind tour, no explanations!)

We'll start learning Rails by plunging straight in and building a simple app. I'm not going to explain anything yet; just follow each step exactly and observe how the code looks and feels as you're writing it. If you've written everything correctly, at the end you'll have a simple, but complete and deployable, Rails application.

Then we'll go through and learn about each of the pieces we wrote.

[Clone the official Rails intro guide, but strip out all the explanations and consolidate some steps, so it's simply following instructions. https://guides.rubyonrails.org/getting_started.html]


## Presentation part 2

Will cover:

  - some of the pieces of Rails you've seen today
  - what we can cover next time
  - how to keep learning
  - invite to join our Slack community

Possible topic ideas:
  How Rails works (basic request lifecycle diagram)
    server is just a computer that waits for an HTTP request, and sends it to your Rails application
    Rails application is just a program that's running on the server, that's waiting for an HTTP request
    postgres: database where most of the app's data is stored
  Rails internals / lifecycle of a request
    router
    controller
    maybe read from / write to the database
    send back a HTML response


