module Enumerable
   
   # The version of the enumerable-extra library.  
   EXTRA_VERSION = '0.1.2'

   alias old_map map
   alias old_collect collect

   # Returns the numeric total of the elements of +enum+, using +total+ as
   # an accumulator (0 by default). Raises an error if any of the elements
   # are non-numeric.
   #
   def sum(total = 0)
      each{ |val| total += val }
      total
   end

   # Returns a new array containing the results of running +method+ once for
   # every element in the enumerable object. If both arguments and a block
   # are provided the arguments are processed first, then passed to
   # the block.
   #
   # If no method argument is provided, then it behaves as the standard MRI
   # method.
   #
   # Examples:
   #
   #  array = ['foo', 'bar']
   #
   #  # No arguments
   #  array.map(:capitalize) => ['Foo', 'Bar']
   #
   #  # With arguments
   #  array.map(:+, 'x') => ['foox', 'barx']
   #
   #  # With arguments and a block
   #  array.map(:capitalize){ |e| e + 'x' } => ['Foox', 'Barx']
   #
   # Note that for 1.9.x users, Enumerator objects are converted explicitly
   # back into arrays.
   #
   def map(method=nil, *args, &block)
      if method
         array  = []
         method = method.to_sym unless method.is_a?(Symbol)

         each{ |obj|
            temp = obj.send(method, *args)
            if block
               array << block.call(temp)
            else
               array << temp
            end
         }

         # Convert enumerators back to arrays for 1.9.x
         RUBY_VERSION.to_f >= 1.9 ? array.to_a : array
      else
         RUBY_VERSION.to_f ? old_map(&block).to_a : old_map(&block)
      end
   end

   # Reset the aliases
   alias collect map
end

class Array
   # These methods are defined separately in array.c, and they are not actual
   # aliases, so we must alias them each separately from Enumerable. 

   alias old_map map
   alias old_map! map!
   alias old_collect collect
   alias old_collect! collect!

   # Returns a new array containing the results of running +block+ once for
   # every element in the +array+.
   #
   # Examples:
   #
   #  array = ['foo', 'bar']
   #
   #  # No arguments
   #  array.map(:capitalize) => ['Foo', 'Bar']
   #
   #  # With arguments
   #  array.map(:+, 'x') => ['foox', 'barx']
   #
   #  # With arguments and a block
   #  array.map(:capitalize){ |e| e + 'x' } => ['Foox', 'Barx']
   #
   # Note that for 1.9.x users, Enumerator objects are converted explicitly
   # back into arrays.
   #--
   # The Array class actually has its own implementation of the +map+ method,
   # hence the duplication.
   # 
   def map(method=nil, *args, &block)
      if method
         array  = []
         method = method.to_sym unless method.is_a?(Symbol)

         each{ |obj|
            temp = obj.send(method, *args)
            if block
               array << block.call(temp)
            else
               array << temp
            end
         }

         RUBY_VERSION.to_f >= 1.9 ? array.to_a : array
      else
         RUBY_VERSION.to_f >= 1.9 ? old_map(&block).to_a : old_map(&block)
      end
   end

   # Same as Array#map, but modifies the receiver in place. Also note that
   # a block is _not_ required. If no block is given, an array of values
   # is returned instead
   #
   def map!(method=nil, *args, &block)
      self.replace(map(method, *args, &block))
   end

   # Reset the aliases
   alias collect map
   alias collect! map!
end
