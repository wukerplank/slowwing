Slowwing
========

Slowwing is a sister project of [Quickwing](https://github.com/wukerplank/quickwing). This is the "naive" implementation of a website that enables you to search Foursquare and Yelp! for places to eat, drink and meet. The search process will be quite slow as the APIs will be polled sequentially and their response times are close to one second - sometimes even longer.

Installation
------------

If you want to run this app you will need to have Ruby (>=1.8.7), RubyGems and Bundler installed.

You can either download a ZIP package or clone the whole repository:

    git clone https://github.com/wukerplank/slowwing.git

Go to the cloned folder and run the bundle command:

    bundle

Now create a `application.yml` file to store your API credentials

    cp config/application.yml.example config/application.yml

If you don't have API keys you can register here:

- [Foursquare](https://developer.foursquare.com)
- [Yelp!](http://www.yelp.com/developers)

Edit the `config/application.yml` file and enter your keys.

Now start the Rails app:

    rails s

Navigate your browser to [http://localhost:3000/](http://localhost:3000/) and start searching!

Copyright
---------

Copyright (C) 2013 Christoph Edthofer, Thomas Esterer and Lukas Mayerhofer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
