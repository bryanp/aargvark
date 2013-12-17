Aargvark is an experiment in normalizing argument lists in Ruby.

### Examples

Here's a real-world example that led to this code.

```ruby
def compose(*args)
  args = Aargv.normalize(*args, path: String, opts: [Hash, {}])

  # do something with args
end

compose('some/path')
# => { path: 'some/path', opts: {} }

compose('some/path', { opt: 'val' } )
# => { path: 'some/path', opts: { opt: 'val' } }

compose(opt: 'val')
# => { path: nil, opts: { opt: 'val' } }
```

