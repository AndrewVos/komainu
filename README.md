komainu
=======

A very simple text search tool.

## Examples

### Simple Search

```ruby
require "komainu"
require "ostruct"

item1 = OpenStruct.new
item1.text = "hello"
item2 = OpenStruct.new
item2.text = "world"
searchables = [item1, item2]
Komainu.search("world", searchables)

#=> {:suggestion=>nil, :items=>["world"]}
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
