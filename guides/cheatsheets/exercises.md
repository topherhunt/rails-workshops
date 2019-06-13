
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
