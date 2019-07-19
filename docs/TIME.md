# Time

Type | Keys
--- | ---
Units | `:milliseconds`, `:seconds`, `:minutes`, `:hours`, `:days`, `:weeks`, `:years`, `:decades`, `:centuries`, `:millenniums`

Option | Type | Default
--- | --- | ---
from, to | symbol | ---

```ruby
klass = Lite::Measurements::Time.new(2)
klass = klass.convert(from: :seconds, to: :minutes)

# - or -

Lite::Measurements::Time.convert(2, from: :centuries, to: :decades)

# - or -

2.convert_time(from: :hours, to: :millenniums)
```
