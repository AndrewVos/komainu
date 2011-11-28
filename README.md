komainu
=======

A very simple text search tool.

[![Build Status](https://secure.travis-ci.org/AndrewVos/komainu.png)](http://travis-ci.org/AndrewVos/komainu)

## Examples

### Simple Search

```ruby
require "komainu"
require "ostruct"

item1 = OpenStruct.new
item1.text = "You are a smelly pirate hooker."

item2 = OpenStruct.new
item2.text = "You look like a blueberry."

item3 = OpenStruct.new
item3.text = "Why don't you go back to your home on Whore Island?"

searchables = [item1, item2]
Komainu.search("blue", searchables)

#=> {:suggestion=>nil, :items=>["You look like a blueberry."]}
```

### Suggestions

```ruby
require "komainu"
require "ostruct"

item = OpenStruct.new
item.text = "Batman has no parents :("
searchables = [item]
Komainu.search("betman", searchables)

#=> {:suggestion=>"Batman", :items=>[]}
```
