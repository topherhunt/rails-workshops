# Exercise: The official Rails guide

In this exercise, you'll build mostly another copy of the same app you built in [Exercise 01](TODO), but this time you'll follow [the official Rails beginner's guide](https://guides.rubyonrails.org/getting_started.html) which contains thorough, detailed explanations of each concept and how it fits into the big picture of Rails.

Open [the official Rails beginner's guide](https://guides.rubyonrails.org/getting_started.html) and follow all steps to build out your web app. Carefully read the explanations along the way. Make note of anything you found confusing or any questions you have.

Good luck!


## Important note: Configure the app to work in Vagrant

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
