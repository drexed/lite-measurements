# Length

Option | Type | Default
--- | --- | ---
from, to | symbol | `:centigrams`, `:decigrams`, `:dekagrams`, `:grams`, `:hectograms`, `:imperial_tons`, `:kilograms`, `:metric_tons`, `:micrograms`, `:milligrams`, `:ounces`, `:pounds`, `:stones`, `:us_tons`

```ruby
klass = Lite::Measurements::Length.new(2)
klass = klass.convert(from: :inches, to: :yards)

# - or -

Lite::Measurements::Length.convert(2, from: :meters, to: :feet)

# - or -

2.convert_length(from: :miles, to: :millimeters)
```
