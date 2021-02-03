# Description

Simple movie ticket booking codebase - [Rails](https://rubyonrails.org/) framework based.

# Development

Clone this repository, make sure required Ruby and bundler installed, in example

```
$ ruby -v
# ruby 2.6.4p104 (2019-08-28 revision 67798) [x86_64-darwin18]

$ bundler -v
Bundler version 2.1.4

```
And run

```
bundle install
```

Start server

```
rails s
# server should be running on http://localhost:3000
```

If databases not created/migrated yet

```
rails db:create
rails db:migrate
rails db:seed
```
