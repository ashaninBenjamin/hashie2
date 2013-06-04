require 'test_helper'

class Hashie::MashTest < TestCase
  def setup
    @name = "My Mash"
    @mash = Hashie::Mash.new
    @mash_with_hash = Hashie::Mash.new({name: @name})
  end

  def test_initialized
    assert !@mash.name?
    assert_nil @mash.name
  end

  def test_attribute_has_changed
    @mash.name = @name
    assert @mash.name?
    assert_equal @name, @mash.name
  end

  def test_mash_with_hash
    assert @mash_with_hash.name?
    assert_equal @name, @mash_with_hash.name
  end
end