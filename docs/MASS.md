# Mass

Type | Keys
--- | ---
Imperical | `:ounces`, `:pounds`, `:stones`, `:us_tons`, `:imperial_tons`
Metric | `:micrograms`, `:milligrams`, `:centigrams`, `:decigrams`, `:grams`, `:dekagrams`, `:hectograms`, `:kilograms`, `:metric_tons`

Option | Type | Default
--- | --- | ---
from, to | symbol | ---

```ruby
klass = Lite::Measurements::Mass.new(2)
klass = klass.convert(from: :ounces, to: :pounds)

# - or -

Lite::Measurements::Mass.convert(2, from: :kilograms, to: :us_tons)

# - or -

2.convert_mass(from: :pounds, to: :micrograms)
```
