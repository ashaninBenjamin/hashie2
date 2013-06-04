require 'test_helper'

class Hashie::DashTest < TestCase
  def setup
    @name = "Bob"
    @p = Person.new(name: @name)
  end

  def test_initialize
    assert_equal @name, @p.name
    assert_equal 'Rubyist', @p.occupation
    assert_equal 'Rubyist', @p[:occupation]
  end

  def test_attribute_has_changed
    @email = 'abc@def.com'
    @p.email = @email
    assert_equal @email, @p.email
  end

  def test_broken_cases
    assert_raise do
      p = Person.new
    end
    assert_raise do
      @p.name = nil
    end
    assert_raise do
      @p[:awesome]
    end
  end
end