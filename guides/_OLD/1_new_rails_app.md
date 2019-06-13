# Exercise 1: Creating and running a very basic Rails app

This guide is mostly copied from [the official Rails beginner's guide](https://guides.rubyonrails.org/getting_started.html), but I adjusted some things to give you as fast & smooth a Ruby & Rails intro as possible. Once you've finished this intro, I'll encourage you to read the official guide; that one will give you deeper understanding of several topics that this guide skips over.


### How to read these guides

These guides will mostly consist of explanatory text, plus `code snippets` showing you what command to run / what code to write / what output you should expect, plus some images.

I'd encourage you to set up your desktop so your text editor and this guide are side-by-side.

I'm constantly trying to improve the guides; please let me know when you see something that you find confusing or that you think could be written differently to be clearer.

Here's a Terminal command example. Lines starting with `#` are comments; the terminal won't run them. Lines starting with `$` (the "command prompt") are commands that the terminal will execute. And after a `$` command, I'll often copy & paste the _output_ that you should expect to see when you run that command. (Output might vary a little.)

```
# This is the command to create a new Rails app.
$ rails new test_app
      create
      create  README.md
      create  Rakefile
      create  .ruby-version
      create  config.ru
      create  .gitignore
      create  Gemfile
         run  git init from "."
  Initialized empty Git repository in /vagrant/test2/.git/
      create  package.json
      create  app
      ...
```

Here's an example Ruby code snippet. If I'm instructing you to add code to an existing file, I might include an `<<<ADD THIS:>>>` comment as shown below.

```ruby
class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to @article
  end

  # <<<ADD THIS:>>>
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article
  end
end
```


### Getting into the Vagrant VM

First, start up your Vagrant VM and log into it. This VM gives everyone an identical setup for running your Rails app.

Open your Terminal client and navigate to your Vagrant folder. That command will look different depending on a) what OS (operating system) you're using, and b) where your Vagrant folder lives.

```
# Windows example:
c:\> cd Documents\my_vagrant_folder

# Mac OSX example:
$ cd ~/Sites/my_vagrant_folder
```

Start the Vagrant VM:

```bash
$ vagrant up
```

Then log into the VM using the `ssh` command:

```bash
$ vagrant ssh
  TODO - output
```

Once you've SSH'd in, run these commands to make sure you're ready to start:

```bash
# "print working directory" - what folder am I currently looking at?
$ pwd
  /vagrant

# make sure Ruby is installed
$ ruby --version
  TODO

# make sure Rails is installed
$ rails --version
  TODO
```


### Create a new Rails app

Rails comes with a few "generator" scripts that make your life easier by creating all the files you need for certain common tasks. Run this command to create a new Rails app:

```bash
$ rails new blog
  create
  create  README.md
  create  Rakefile
  create  .ruby-version
  ...
  Using uglifier 4.1.20
  Using web-console 3.7.0
  Bundle complete! 18 Gemfile dependencies, 78 gems now installed.
```

This command produces lots of output! Skim through the terminal output so you can get a feel for what just happened. The main effect of `rails new` is to:

  * Create a new project folder with a ton of new files inside it, especially in the subfolders `app/`, `config/`, and `test/`.
  * Install a bunch of _Ruby gems_. Gems are online Ruby libraries that this code depends on, such as `rack` and `sass`.

Open your new `blog` project folder in your text editor and take a look around the new files it created. Every Rails project has the same basic structure of files & folders in it. The most important folders & files are:

  * `app/` - contains most of the "meat" of your Rails app: the controllers, models, views, helpers, mailers, JS/CSS assets, etc.
  * `bin/` - contains scripts for starting the Rails server and related tasks. You can mostly ignore this folder.
  * `config/` - contains files that configure the Rails app, e.g. what routes are available, how to connect to the database, how to run tests, etc.
  * `db/` - defines your database structure and the _migration_ files for how to change it.
  * `log/` - contains the app's logfiles. When you run the Rails server, it will write all output to `log/development.log`.
  * `public/` - contains "static" files that are available on the server. You can mostly ignore this folder.
  * `test/` - contains the _test suite_, which is a bunch of scripts for testing that your app does what you expect it to do. Writing tests is a _super important_ part of being a Rails developer, but we won't focus on tests today.
  * `tmp/` - contains temporary files autogenerated by Rails. You can mostly ignore this folder.
  * `Gemfile` - defines all _gems_ (online Ruby libraries) that your app depends on.

Before we start working on this new app, we need to make one config change so that the development Rails server will work more nicely in your Vagrant VM. Open `config/environments/development.rb` in your text editor, scroll to the bottom, and modify the last few lines as follows:

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

Now let's start the server to check that your new app is working:

```bash
# Need to change directory so you're in the new Rails project
$ cd blog

$ rails server
  > Booting Puma
  => Rails 5.2.3 application starting in development
  => Run `rails server -h` for more startup options
  Puma starting in single mode...
  * Version 3.12.1 (ruby 2.5.5-p157), codename: Llamas in Pajamas
  * Min threads: 5, max threads: 5
  * Environment: development
  * Listening on tcp://0.0.0.0:3000
  Use Ctrl-C to stop
```

Then in your web browser, open the standard Rails development server address: http://localhost:3000/. You should see Rails' built-in welcome page with the title "Yay! You're on Rails!".

TODO: image


### Customize the landing page

You've seen that the Rails server is displaying a generic welcome page at your _root path_ (http://localhost:3000/, often described as "/"). Let's customize the text that shows up on this page.

To create a custom page, you need two things: a _controller_ and a _view_. The **controller** contains logic / code for handling requests to a particular path (such as `/` or `/articles/123/edit`). The **view** is where you write the HTML code that should be shown on a particular page.

Create our new controller using this command:

```bash
$ rails generate controller Welcome index
      create  app/controllers/welcome_controller.rb
       route  get 'welcome/index'
      invoke  erb
      create    app/views/welcome
      create    app/views/welcome/index.html.erb
      ...
```

This `generate` command creates several more files. The only important ones for now are `welcome_controller.rb` (which defines the controller) and `index.html.erb` (which defines the view).

If you open `app/controllers/welcome_controller.rb`, you'll see that the basic controller has already been defined for you with one _action_ called `index`. We don't need to make any changes here for now.

```ruby
class WelcomeController < ApplicationController
  def index
  end
end
```

Now open `app/views/welcome/index.html.erb` and replace its contents with the following:

```html
<h1>My super fancy Rails app</h1>
<p>[Write some important announcement here]</p>
```

We also need to tell the Rails router to use this controller for the homepage. Open `config/routes.rb` and add a line to the end of it to connect the "root path" to your new controller:

```ruby
Rails.application.routes.draw do
  get 'welcome/index'

  # <<<<<<ADD THIS:>>>:::>>>
  root "welcome#index"
end
```

That should be all we need! Reload http://localhost:3000/ in your browser, and you should see the text you wrote.


### A note about autoloading

The Rails development server tries to be smart for you. When you make changes to files in the Rails app (add a controller, change the text in a view, etc.), Rails will autoload those changes so that the next time you refresh the browser page, you'll see your changes show up. If this doesn't happen, double-check that you configured `ActiveSupport::FileUpdateChecker` correctly. (See above.)

Some major changes can't be autoloaded; you'll need to restart the server for those. Quit the server process (in the Terminal tab where the server is running, press `Ctrl` + `C`) then restart it by running `rails server` again.


### Add a Model and do some CRUD

We've added a static page to the app. Obviously Rails can do much more interesting and dynamic stuff than that. Next, we'll add the ability for the user to write, edit, and view Articles to make this site into a very basic blog.

First you should learn about a couple important concepts:

  * **Model**: A Model is some resource, some type of thing, that a Rails app can create, store in its database, and display information about. Each Model should be thoughtfully named to describe the concept that it's representing. For example a Rails app for an online store might have models for `Customer`, `Merchandise`, and `Invoice`. Rails uses an amazing library called **ActiveRecord** to give you easy ways to work with your models.
  * **CRUD**: Functionality / pages to read & write a resource is often referred to as **CRUD operations**: **C**reate, **R**ead, **U**pdate, **D**elete. A common pattern is to have one Rails controller containing all of the CRUD actions for a particular resource / model.
  * **REST**: REST is a philosophy for how to organize your app's routes (URLs, paths) into "RESTful resources". Basically, this means grouping all of a resource's CRUD operations together into one controller using a standard pattern. [See here for more about REST.](https://www.sitepoint.com/restful-rails-part-i/)

If these ideas _kinda_ make sense, that's fine; they'll get clearer with practice. If they _completely don't_ make sense, ask me for help! It's important to me that you have a basic feel for how all of these ideas fit together.

OK, let's add some RESTful CRUD pages for our new Article model.

We'll start by creating the Article model. For a simple model, the generator command does almost all the work:

```bash
# Syntax: rails generate model CLASS_NAME [field1:type field2:type ...]
$ rails generate model Article title:string text:text
      invoke  active_record
      create    db/migrate/20190608114335_create_articles.rb
      create    app/models/article.rb
      invoke    test_unit
      create      test/models/article_test.rb
      create      test/fixtures/articles.yml
```

Note the syntax of the above command. The first argument after `rails generate model` is the model's class name, `Article`. The final two arguments are the _fields_ that this model will store (title and text), along with each field's _type_.

This generate command created two important files:

  * `app/models/article.rb` - this defines the Article model itself. This is where (later on) we'll put things like validation rules, associations with other models, and custom logic related to this model.
  * `db/migrate/123456_create_articles.rb` - this is the _migration file_ which tells our database to create a table to store these Articles.
  * You can ignore the test and fixture files for now.

Next we'll add RESTful routes for the article CRUD pages. We'll need to add a line to the end of `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  # ... other stuff
  root "welcome#index"

  # <<<<<<ADD THIS:>>>::>>>
  resources :articles
end
```

That magic command `resources :articles` creates _eight_ new routes following the standard REST pattern. Run `rails routes` to see them:

```bash
$ rails routes
            Prefix Verb   URI Pattern                   Controller#Action
     welcome_index GET    /welcome/index(.:format)      welcome#index
              root GET    /                             welcome#index
          # vvv These are our shiny new routes for Article CRUD stuff!
          articles GET    /articles(.:format)           articles#index
                   POST   /articles(.:format)           articles#create
       new_article GET    /articles/new(.:format)       articles#new
      edit_article GET    /articles/:id/edit(.:format)  articles#edit
           article GET    /articles/:id(.:format)       articles#show
                   PATCH  /articles/:id(.:format)       articles#update
                   PUT    /articles/:id(.:format)       articles#update
                   DELETE /articles/:id(.:format)       articles#destroy
# ... other complicated stuff, which you can ignore
```

In the above table, note that each route has 4 pieces of information shown:

  * The **route prefix**: the "name" of that route, used when you want to display a link to a route, for example `article_path(@my_article.id)`
  * The **HTTP verb**: what type of HTTP request you can use to reach this route. `GET` requests are mostly only used when you're requesting information but not making changes. `POST` requests are used when creating a resource; `PATCH` requests are used when modifying an existing resource, and `DELETE` requests are used when destroying something. [Learn more here.](https://www.sitepoint.com/restful-rails-part-i/) These are only guidelines, not hard-and-fast rules, but Rails' RESTful philosophy makes heavy use of them.
  * The **URL pattern** for this route. The route will only be matched (in other words, that controller action will only be run) if the URL fits this pattern. For example, the `edit_article GET` route _will_ be called when someone makes a GET request to `http://localhost:3000/articles/123/edit` or `http://localhost:3000/articles/999999/edit`, but _not_ if the URL is `http://localhost:3000/articles/123/edit2`.
  * Which **controller** (and which **action** on that controller) will be called to handle requests to this route. Note that these are similar to our CRUD operations: create, show, update, destroy -- with a few other standard actions (index, new, edit).

That was a lot of concepts. Now we'll write the corresponding controller actions and views, and it will all get a little more concrete.

Our first goal is to give the user a place to write a new Article. Go to http://localhost:3000/articles/new in your web browser. Currently it displays an error message, understandably because the expected controller doesn't exist:

TODO - image

Let's fix that:

```bash
# Syntax: rails generate controller CONTROLLER_NAME [action1 action2 ...]
rails generate controller Articles new
      create  app/controllers/articles_controller.rb
       route  get 'articles/new'
      invoke  erb
      create    app/views/articles
      create    app/views/articles/new.html.erb
      ...
```

This command generated a simple `ArticlesController` (feel free to take a look at it) with one action called `new`, and a corresponding view, `new.html.erb`. Now if you reload http://localhost:3000/articles/new, you'll see that the contents of `new.html.erb` are showing up on the page:

TODO - image

Let's edit `app/views/articles/new.html.erb` to have a _form_ where an article can be written:

```html
<h1>New Article</h1>

<%= form_for @article do |form| %>
  <p>
    <%= form.label :title %><br>
    <%= form.text_field :title %>
  </p>
  <p>
    <%= form.label :text %><br>
    <%= form.text_area :text %>
  </p>
  <p><%= form.submit %></p>
<% end %>
```

Here we used Rails' `form_for` helper which generates the code for an HTML form. Let's see if this form works; refresh the page.

TODO - image

Nope, didn't work. We gave the form a variable called `@article`, but first we need to define that variable in the controller action. Open up `app/controllers/articles_controller.rb` and edit the action to define `@article` as simply a new, blank Article object:

```ruby
class ArticlesController < ApplicationController
  def new
    # <<<<<<ADD THIS:>>>:>>>
    @article = Article.new
  end
end
```

Now refresh the page again, and you should see a very simple, very ugly "New article" form. And if you view the page source (in Chrome: View -> Developer -> View source) you'll see the HTML code that defines that form. Note that the form magically figures out what path to use for its `action` attribute (ie. what URL the form will submit to).

```html
  <h1>New article</h1>

  <!-- (Rails autogenerates some messy stuff to help make the form secure) -->
  <form action="/articles" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="UiaNyvA1uKQoOX5IPJ67/nBlwoX8eiaSzt6gv36Aj+K7wqFYpXOeTrKZL6lnJpMHx68MKGAh3hUUQ8rDvORU/g==" />
    <p>
      <label for="article_title">Title</label><br>
      <input type="text" name="article[title]" id="article_title" />
    </p>
    <p>
      <label for="article_text">Text</label><br>
      <textarea name="article[text]" id="article_text"></textarea>
    </p>
    <p><input type="submit" name="commit" value="Create Article" data-disable-with="Create Article" /></p>
  </form>
```

Now we want the user to be able to submit this form to save their new Article. If you try to submit it now, you'll get an error:

TODO - image

This makes sense; we tried to submit the form to the "create article" route, but `ArticlesController` doesn't have a `create` action. Let's write one that simply prints out the submitted _request parameters_ so we can see what data the controller has to work with. Add the `create` action to `app/controllers/articles_controller.rb`:

```ruby
class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  # <<<ADD THIS:>>>
  def create
    render plain: params
  end
end
```

Now go back to http://localhost:3000/articles/new and re-submit this form. You'll see a Ruby data structure showing all the parameters that were sent along with this request. You can ignore most of these params; what's important is this part in the middle:

```
... "article" => {"title" => "Some title", "text" => "Some body"}, ...
```

These `title` and `text` fields are the content I wrote into the form, and that's what we want to save in the database. Rewrite the `create` action to create a new article from those params:

```ruby
class ArticlesController < ApplicationController
  ...

  # <<<UPDATE THIS:>>>
  def create
    @article = Article.new(params[:article])
    @article.save
    redirect_to @article
  end
end
```

Note that the above code uses a Rails feature called "mass assignment" to assign multiple params (`title` and `text`) to the new article all at once. That's convenient, but it creates one problem. Try submitting the form, and you'll get a different error:

TODO - image

This error is due to a security feature of Rails called [strong parameters](https://guides.rubyonrails.org/action_controller_overview.html#strong-parameters). When a user submits an HTML form, Rails doesn't trust that _all_ of the form fields ("request parameters") are OK to save to the database. A hacker could easily modify the HTML form to include other fields that we don't want them to mess with. So instead of simply creating an article with _all_ of the request parameters, we need to specify exactly which params are OK to update.

We'll fix this by using a _helper method_ (a function) called `article_params`, to define exactly what params we'll use when we create the article:

```ruby
class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  # <<<UPDATE EVERYTHING BELOW:>>>

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
```

We could have gotten the same result with fewer lines of code without the `article_params` method (like this: `@article = Article.new(params.require(:article).permit(:title, :text))`). But extracting the params stuff to an `article_params` helper has two advantages:

  1. It helps keep the code readable, so it's easier to understand and maintain.
  2. Later on, we can re-use this `article_params` logic when we want to _update_ an article.

Anyway, if you re-submit the form, you'll get yet another error:

TODO - image

This is good news. It means that _creating_ the article succeeded, and then the app crashed because we tried to _show_ the new article but we haven't yet written a controller action for that. Let's add a `show` controller action after the `create` action:

```ruby
class ArticlesController < ApplicationController
  ...

  # <<<ADD THIS:>>>
  def show
    @article = Article.find(params[:id])
  end

  # NOTE: the show action MUST come above the "private" statement.
  # All methods below "private" are treated differently / cannot be controller actions.
  private

  def article_params
    ...
end
```

This `show` action is pretty simple: it just needs to load the article from the database, based on the `id` parameter that must be included in the request.

We also need to write a view for that show page. Save this to `app/views/articles/show.html.erb`:

```
<p>
  <strong>Title:</strong>
  <%= @article.title %>
</p>
<p>
  <strong>Text:</strong>
  <%= @article.text %>
</p>
```

Now you can refresh the page and

TODO TODO TODO




TODO: Once we've filled in all the crud actions, take another look at `rails routes` and notice that the controller actions we've written exactly correspond to the routes we created earlier.







TODO

  - Consider using Postgres instead of SQLite. How much extra complexity does that add?




### Extra credit

  * Open up `articles_controller.rb`. What happens if you re-order some of the methods inside it? (e.g. `def create`, `def show`, etc.) Do they act differently if you change what order they're written in?
  * What happens if you rename `articles_controller.rb` to `some_other_file.rb`? Does Rails care what the file's name is?


TODO: Extra credit for the first half


### Homework

  * Things to read
  * As mentioned above, this guide is an abbreviated version of [the official Rails beginners' guide](https://guides.rubyonrails.org/getting_started.html). Read through that guide to get a much more detailed understanding of what we've written and why.

  * Quiz / reflections:
    * Pick one thing about the Rails exercise you just did, that confuses you / that you found hard to understand. What's one question you'd like to ask me so far? What's your best guess as to what the answer is? And _why_ does this question matter to you?
    * After reading the Rails guide, what's one difference you notice between my guide and the official guide? Why do you think I deviated from the official guide?
    * When starting a `rails new` app, why does it need to create so many files right away?
  *



### Lecture: What were all those things?

We just saw a huge amount of code fly by. Some you might have questions about. Here's a quick tour of some of the things we saw. You don't need to memorize any of this, I just want to give you a feel of what's going on.

  * The router (important)
  * Route helpers (e.g. articles_path)
  * Controllers and controller actions (important)
  * Views (usually corresponds to a specific controller action)
  * ???


### Quiz


  * What does CRUD stand for?







### TODO: Setting up Postgres

We need to tell the Rails app to use our PostgreSQL database. Open `Gemfile` and replace the `gem 'sqlite3'` statement with the following line:

```
gem 'pg'
```

Save the file, then run the `bundle install` command to install the new gem.

Open `config/database.yml` and replace its contents with the following. Notice that this config file describes three different _environments_ where the app can be run: `development`, `test`, `production`. In our simple case, the `default` settings are applicable to all environments.
```
default: &default
  adapter: postgresql
  encoding: unicode
  database: very_special_app_<%= Rails.env %>
  username: vagrant
  password:
  pool: 5
  timeout: 5000

development:
  <<: *default

test:
  <<: *default

production:
  <<: *default

```

Now create the database for your development site:

```
rails db:create

  # Output:
  Created database 'very_special_app_development'
  Database 'very_special_app_development' already exists
```




[TODO: Fill in the rest of this initial exercise - notes:]

  * create the CreateArticles migration
  * write the Article model (this tells Rails that we're storing a certain kind of thing called an Article)
  * add routes (simple crud for Articles)
    * declare each route separately for now. No "resources" yet.
  * add ArticlesController with very simple actions (index / show / new / create)
  * add the index, show, and new views
  * add navbar links to the layout
  * start the app
  * test it out by adding and viewing articles
