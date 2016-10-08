# Blagar (BETA)

Blagar, yet another static blog generator — server included.

Note: [your/crystal-server](https://github.com/your/crystal-server) is used by this gem as HTTP server.

## Installation (DEV)

Install [Crystal](https://github.com/crystal-lang/crystal) first, then:

```
  # clone repo
  git clone https://github.com/your/blagar.git
  gem build blagar.gemspec

  # create project folder and copy gem
  mkdir ../tinyblog && cd "$_"
  cp ../blagar/blagar-0.1.0.beta.1.gem blagar-0.1.0.beta.1.gem
  gem unpack blagar-0.1.0.beta.1.gem

  # setup gem
  bundle exec ./bin/setup
```

## Usage

* Edit your `shared.tpl` file in `tinyblog/` (it's a shared HTML partial template)
* Place your markdown files under `tinyblog/source/md/`
* `bundle exec blagar`
* Go to [http://localhost:8081/test](http://localhost:8081/test)

## WIP

Of course it is.

## License: MIT
