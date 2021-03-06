########################################################################
# tc_enumerable_extra.rb
#
# Test case for the enumerable-extra library. You should run this
# test via the 'rake test' task.
########################################################################
require 'test-unit'
require 'enumerable/extra'

class TC_Enumerable_Extra < Test::Unit::TestCase
  def setup
    @words   = %w/foo bar baz/
    @numbers = [1,2,3]
    @hash    = {'foo' => 1, 'bar' => 2}
    @array   = []
  end

  test "version number is set properly" do
    assert_equal('0.2.0', Enumerable::EXTRA_VERSION)
  end

  def test_sum
    assert_respond_to(@numbers, :sum)
    assert_equal(6, @numbers.sum)
    assert_equal(20, @numbers.sum(14))
  end

  def test_sum_expected_errors
    assert_raises(TypeError){ @words.sum }
  end

  def test_map_array_no_block
    assert_nothing_raised{ @words.map }
    assert_equal(%w/foo bar baz/, @words.map)
    assert_equal(%w/FOO BAR BAZ/, @words.map(:upcase))
    assert_equal(%w/fooA barA bazA/, @words.map(:+, 'A'))
    assert_equal(%w/foo bar baz/, @words) # Verify receiver unmodified
  end

  # Test the alias explicitly
  def test_collect_array_no_block
    assert_nothing_raised{ @words.collect }
    assert_equal(%w/foo bar baz/, @words.collect)
    assert_equal(%w/FOO BAR BAZ/, @words.collect(:upcase))
    assert_equal(%w/fooA barA bazA/, @words.collect(:+, 'A'))
    assert_equal(%w/foo bar baz/, @words) # Verify receiver unmodified
  end

  def test_map_bang_array_no_block
    assert_nothing_raised{ @words.map! }
    assert_equal(%w/foo bar baz/, @words.map!)
    assert_equal(%w/FOO BAR BAZ/, @words.map!(:upcase))
    assert_equal(%w/FOO BAR BAZ/, @words) # Verify receiver modified
  end

  def test_map_with_block
    assert_nothing_raised{ @words.map{} }
    assert_nothing_raised{ @words.map{ |e| @array << e } }
    assert_equal(%w/foo bar baz/, @array)

    @array = []
    assert_nothing_raised{ @words.map(:upcase){ |e| @array << e } }
    assert_equal(%w/FOO BAR BAZ/, @array)

    @array = []
    assert_nothing_raised{ @words.map(:+, 'A'){ |e| @array << e } }
    assert_equal(%w/fooA barA bazA/, @array)
    assert_equal(%w/foo bar baz/, @words) # Verify receiver unmodified
  end

  test "each accepts arguments" do
    a1 = [1,2,3]
    a2 = [4,5,6]
    assert_nothing_raised{ a1.each(a2){} }
    assert_equal([[1,4],[2,5],[3,6]], a1.each(a2))
  end

  test "each defaults to using the old behavior if no arguments are passed" do
    assert_nothing_raised{ @array.each{} }
  end

  def teardown
    @words   = nil
    @numbers = nil
    @hash    = nil
    @array   = nil
  end
end
