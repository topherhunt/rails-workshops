# Module 01: Intro to Ruby and Rails

This module will introduce you to all the basic concepts in Rails web development.


## Requirements

Skills:

  * If you haven't done web development before, [read this article TODO](TODO) so you have a basic understanding of how a website works: HTML, webpages, servers, browsers, HTTP requests, server-side languages, databases.
    - TODO: Is there a good, straightforward article that breaks this down? If I can't find one, write my own and include it here.

  * If you aren't familiar with HTML, [read this HTML cheatsheet](TODO) so you have a basic sense of what HTML looks like and how it works.

  * If you aren't familiar with Ruby, [read this Ruby cheatsheet](TODO) so you have a basic sense of what Ruby looks like and how it works. You don't need to memorize anything, just get a basic feel for it.

  * No Rails experience is required.

Setup steps:

  * **IMPORTANT**: At least **2 days** before the workshop: Make sure your Vagrant environment is installed and working properly by carefully following [these setup steps](/help/working_with_vagrant.md). **If you don't have Vagrant set up properly, you can't participate in these workshops!** If you run into trouble, please email me (hunt DOT topher AT gmail DOT com) and I'll gladly help you out.

  * Make sure you have a decent code editor. Almost any plain-text editor will work. My favorites are [Sublime Text](TODO) or [Github Atom](TODO).

  * _Bring an answer to this question:_ If you had all the skills and all the time you needed, what is one web application that you would love to build? Describe it. What problem would this app solve? What "need" would it fulfill in the world?


## Lecture: How these workshops will work

Link to a pres

Topic ideas:

  Who I am
  why I'm doing this
  my goals
  Join the Slack channel for questions / help / just chatting on anything related to these workshops


## Lecture: What is Ruby? What is Rails?

Rough topic ideas:

What is Ruby?
What is Rails?

Why learn Rails instead of working with another framework that you might be more familiar with?
Alternative languages & frameworks. Why so many?
How Rails fits into the broader context of the internet

Platform differences, installation hell, and our Vagrant setup




## Exercise: Build a simple Rails application (part 1)

TODO: Incorporate the official Rails guide, with a couple caveats.

Idea: Maybe make a copy of the official guide HTML, so I can break it into 2+ chunks. But be clear about the fact that I'm wholesale copying it, and link to the orig.

The old snippet:

-----------

In this exercise, you'll build mostly another copy of the same app you built in [Exercise 01](TODO), but this time you'll follow [the official Rails beginner's guide](https://guides.rubyonrails.org/getting_started.html) which contains thorough, detailed explanations of each concept and how it fits into the big picture of Rails.

Open [the official Rails beginner's guide](https://guides.rubyonrails.org/getting_started.html) and follow all steps to build out your web app. Carefully read the explanations along the way. Make note of anything you found confusing or any questions you have.

Good luck!

**Important note: Configure the app to work in Vagrant**

To make Rails work inside Vagrant, you'll need to do one extra step after running the `rails new` command. Open `config/environments/development.rb` and edit the last few lines as follows:

```ruby
# <<<REPLACE THIS:>>>
  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

# <<<WITH THIS:>>>
  # Need to use a different file update polling strategy because we're in Vagrant
  # Thanks to https://stackoverflow.com/a/36616931/1729692
  config.file_watcher = ActiveSupport::FileUpdateChecker
```

-----------


## Lecture & discussion: What was all that?

Link to a presentation document. G Slides? Markdown-to-slides?

Possible topic ideas:
  How Rails works (basic request lifecycle diagram)
    server is just a computer that waits for an HTTP request, and sends it to your Rails application
    Rails application is just a program that's running on the server, that's waiting for an HTTP request
    postgres: database where most of the app's state is stored
  Rails internals / lifecycle of a request
    router
    controller
    maybe read from / write to the database
    send back a HTML response

Review the important pieces we just touched

Show all of the most important terms & concepts together on one page / diagram


## Exercise: Build a simple Rails app (part 2)









TODO: The targeted broad outline:

  Intro lectures & setting the context
  Students dive in and follow copypasta instructions to build out their first Rails app.
  Lectures & discussion: What was all of that? All the pieces involved in a Rails app
