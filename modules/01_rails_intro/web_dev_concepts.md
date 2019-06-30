# Basic concepts in the web development world

TODO


Topics to cover:

  * what HTML is. HTML is a _markup_ language, not really a _programming_ language. It lets you do styling, layout, colors, include images, etc.
  * server-side languages
    - common ones include: PHP, Ruby, Python, Elixir
    - usually combined with a _web framework_ such as Rails.
  * when you make a request to a server, it _runs_ server-side code which _generates_ HTML code which is sent back to the web browser
  * Your web browser knows how to display HTML documents, but doesn't know anything about the server-side code that generated the HTML.
  * Lifecycle of an HTTP request
    - browser makes a request to a URL (address)
    - The Magical Internet routes that request to the right server based on the URL's _domain_
    - The server is running some software (ie. server-side code) which decides how to respond to that request
    - The server generates an HTML _response_ page, and sends that back to the browser
    - The browser renders that HTML into the page you see
  * There's multiple types of HTTP requests, named after different _HTTP verbs_ or types of actions you can take. The common HTTP verbs are: `GET` (request data, without making any changes), `POST` (create a new thing), `PATCH` (make a change to something), and `DELETE` (destroy a thing). Most browser requests are `GET` requests, but when you submit a form such as a login form, that's a `POST` request. You don't need to understand these HTTP verbs in detail yet; just know that there's 4 common kinds of HTTP requests, and that GET is the most common one.



Assorted thoughts:

  *
