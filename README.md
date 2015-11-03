# KnockOn

Knock on the office :door:

[![Circle CI](https://circleci.com/gh/tmd45/knock-on.svg?style=svg&circle-token=46d3d06e82961e685840105d5c114cab7371f69d)](https://circleci.com/gh/tmd45/knock-on)

## Requirement

- [Node.js](http://nodejs.org/)
- [Ruby](https://www.ruby-lang.org/)

## Getting start

### Setup

```
$ ./script/bootstrap
```

### Start Local Server

```
$ ./bin/rails server Puma
```

## Preview

On Heroku https://knock-on-devel.herokuapp.com/

## Deployment

### Automatic preview deployment

:ribbon: When a Pull request is merged to `master`, CircleCI will deploy to Heroku.

### Manual deployment to Heroku

:moyai: You can deploy to https://knock-on-devel.herokuapp.com/ for checking any branch.

```
$ git push -f heroku <branch name>:master
```
