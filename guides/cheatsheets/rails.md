# Cheatsheet: Ruby and Rails


## Rails commands

  * `rails server`
  * Press `Ctrl` + `C` to stop the server.
  * `rails generate controller Articles index new create edit update destroy`
  * `rails generate model Article title:string text:text`
  * `rails routes` - list all routes registered in the app
  * `rails db:migrate`


## Elements of Rails

### Pages (controllers and views)

To add a page to your Rails site, you need at least three things:

  * a **route** defined in `config/routes.rb`. The routes file tells Rails what URLs it can handle, and what controller to use for each URL.
  * a **controller** with at least one **action** defined. The controller contains code specifying how Rails should handle this page request.
  * a **view** named the same as that controller action. This is where you write the HTML code that should be shown on the page.


### Autoloading

The Rails development server tries to be smart for you. When you make changes to files in the Rails app (add a controller, change the text in a view, etc.), Rails will autoload those changes so that the next time you refresh the browser page, you'll see your changes show up. If this doesn't happen, double-check that you configured `ActiveSupport::FileUpdateChecker` correctly. (See above.)

Some major changes can't be autoloaded; you'll need to restart the server for those. Quit the server process (in the Terminal tab where the server is running, press `Ctrl` + `C`) then restart it by running `rails server` again.
