# DEPRECATION WARNING
This library is no longer maintained and the repository has been archived.

## Description
This library includes modified versions of the Enumerable methods, designed
to make list comprehensions a little bit easier and prettier in Ruby.

## Installation
`gem install enumerable-extra`

## Synopsis
```ruby
require 'enumerable/extra'

array = %w[foo bar baz]

array.map(:upcase) => ['FOO', 'BAR', 'BAZ']
array.map(:+, 'A') => ['fooA', 'barA', 'bazA']

numbers = [1,2,3]
numbers.sum => 6
```

## Motivation
This library was created in reaction to the ugly "&" (or worse, "&its")
notation started by Ruby on Rails and perpetuated by the Symbol#to_proc
adherents.

The theory behind Symbol#to_proc is that it's a generic metaprogramming
solution that will solve a certain range of programming problems. The
reality is that 99% of people use it for list comprehensions*. So, instead
of introducing crappy notation, I decided that it made better sense to
modify Enumerable methods to accept arguments.

There are two advantages to this. First, superior notation, i.e. no need
for the ampersand. One of the reasons I chose Ruby as my primary programming
language in the first place was the beauty of its notation. I don't want
to see that ruined by Symbol#to_proc. Also, coming from a C background, I
find the ampersand too reminiscent of C address notation.

Second, Symbol#to_proc is very slow.
 
Update: It seems Symbol#to_proc is reasonably fast now in the 1.9.x branch.*
However, it does not allow you to pass arguments to a method. That means
you still can't do the equivalent of [1,2,3].map(:+, 1), for example.

* Based on the questions and solutions that I see on the ruby-talk and rails
  mailing lists. I've monitored the former for almost seven years and the
  latter for close to two now. This is in addition to many blogs I read that
  occasionally touch on the subject.

Update 2: Whatever my original motivation was originally it simply didn't hold
up. The community embraced Symbol#to_proc, and the core language made some
updates as well, rendering this library pointless.

## Future Plans
None. This library is deprecated, and the repository has been archived.

## License
Artistic-2.0

## Copyright
(C) 2009-2021 Daniel J. Berger, All Rights Reserved

## Warranty
This package is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantability and fitness for a particular purpose

## Author
Daniel J. Berger
