# Digital Storage

Type | Keys
--- | ---
Units | `:bytes`, `:kilobytes`, `:megabytes`, `:gigabytes`, `:terabytes`, `:petabytes`, `:exabytes`

Option | Type | Default
--- | --- | ---
from, to | symbol | ---

```ruby
klass = Lite::Measurements::DigitalStorage.new(2)
klass = klass.convert(from: :bytes, to: :kilobytes)

# - or -

Lite::Measurements::DigitalStorage.convert(2, from: :megabytes, to: :bytes)

# - or -

2.convert_digital_storage(from: :terabytes, to: :petabytes)
```
