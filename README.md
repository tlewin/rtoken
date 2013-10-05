# RToken

Simple Random Token Generator for general purpose.

```ruby
require 'rtoken'
    
# Generates a random 8 length token with letters and numbers
puts RToken.rtoken 
```
  
Install the gem:

    gem install rtoken
  
## Examples

```ruby
require 'rtoken'

# Generates a random 16 length token with letters and numbers 
# and some special chars
RToken.rtoken(:size => 16, :special_chars => '!@#$%')

# Generates a random 32 length token with ONLY letters
RToken.rtoken(:size => 32, :numeric => false)

# Generates a random token with all lowercase chars
RToken.rtoken(:size => 32, :numeric => false, :lowercase => true)
```

It is possible to create an instance with predefined options

```ruby
require 'rtoken'

rtkn = RToken.new(:size => 10, :special_chars => '+-*/')

# All subsequent calls will keep the same options
rtkn.rtoken #=> Random 10 length token with special chars

# It is possible to make individual changes
rtkn.rtoken :size => 4 #=> Random 4 length token with special chars
rtkn.rtoken 4 # Less verbose fashion
```

## Command line

RToken include interface for command line token generation.

It's handfull for creation of password, secret keys, etc.

    Usage: rtoken [options]
        -s, --size TOKEN_SIZE            token size (default 8)
        -U, --uppercase                  only uppercase chars (default false)
        -l, --lowercase                  only lowercase chars (default false)
        -n, --[no]-numeric               allow numeric chars [0-9] (default true)
        -p, --special CHARS              include special chars
        -c, --clipboard                  copy token to the clipboard (default false)
        -h, --help                       show this message  