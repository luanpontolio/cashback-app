## Lemoney

## Summary

- [Introduction](#introduction)
- [Dependencies](#dependencies)
- [installation](#installation)
  - [Ruby version](#ruby-version)
  - [Development](#development)
  - [Test](#test)
- [Running](#running)
- [Consideration](#consideration)

## Introduction

This project is a display offers to users and here have Admin and User sections.

## Dependencies

Please, check the `Gemfile`.

[Back to the top](#readme)

## Instalação

After clone project from github, follow the steps:

## Ruby version

Rubt 2.5.7
Postgres 10.5

## Development

To start project in development run:

### Step 1

After ruby version instaled:


### Docker

The project have Dockerfile and docker-compose.yml

Using Dockerfile:

```
$ cd luan-pontolio
$ docker build -t cashapp-back/cashapp-back:0.0.1 .
$ docker run -it cashapp-back/cashapp-back:0.0.1 bash
```

Using docker-compose:

```
$ docker-compose up -d
```

[Back to the top](#readme)

### Ruby on Rails

After created the containers execute:

```
$ bundle install
$ rails db:setup
$ rails db:seed
```

## Running

execute the final step

```
$ rails s
```

And now access the [local server](http://localhost:3000/admin)

## Consideration

The project is not finished yet, we need to do:

* Unit Tests
* User section(list offers)

## Contribuidores

- Luan Silveira Pontolio [github](https://github.com/luanpontolio)

[Back to the top](#readme)
