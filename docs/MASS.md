# Mass

Option | Type | Default
--- | --- | ---
from, to | symbol | `:centigrams`, `:decigrams`, `:dekagrams`, `:grams`, `:hectograms`, `:imperial_tons`, `:kilograms`, `:metric_tons`, `:micrograms`, `:milligrams`, `:ounces`, `:pounds`, `:stones`, `:us_tons`

```ruby
klass = Lite::Measurements::Mass.new(2)
klass = klass.convert(from: :ounces, to: :pounds)

# - or -

Lite::Measurements::Mass.convert(2, from: :kilograms, to: :us_tons)

# - or -

2.convert_mass(from: :pounds, to: :micrograms)
```
