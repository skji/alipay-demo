# Alipay Demo

Ailpay Demo is a Rails app using [alipay](https://github.com/chloerei/alipay) gem.

## Deploy to Heroku

In most cases, alipay gem need online debug. Recommend deploy to Heroku, a cloud service allow deploy small rails app for free.

### Sign up Heroku

Sign up here https://www.heroku.com/ , free account is enough.

### Install Heroku CLI

See https://toolbelt.heroku.com/

### Login Heroku

```console
$ heroku login
```

### Create Heroku app

```console
$ cd alipay-demo
$ heroku create
```

### Push to Heroku

```console
$ git push heroku master
```

### Config ENV vars

```console
$ heroku config ALIPAY_PID=xxx
$ heroku config ALIPAY_KEY=xxx
$ heroku config ALIPAY_SELLER_EMAIL=xxx
```

Replace xxx to your test alipay account config.

### Open website in browser

```console
$ heroku open
```

Done.

## Deploy to self-host server

If you don't want to set alipay key in Heroku, you can deploy to self-host server.

Alipay Demo is a simple Rails app, it also don't need to setup database, just deploy it like other Rails app as your experience.

Notice that Alipay Demo use ENV vars to set alipay config.

## Run in local

If you install Heroku CLI, you have already install Foreman, a tool for execute process from Procfile and set ENV vars read from .env file.

### Install Foreman (skip this step if you have installed Heroku CLI)

```console
$ gem install foreman
```

### Config ENV vars

```console
$ cp .env.example .env
```

Edit .env with your favorite editor.

### Run

```console
$ bundle
$ foreman start
```
