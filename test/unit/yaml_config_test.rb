require_relative '../helper'

class DummyConfig
  include YamlConfig
end

class TestYamlConfig < Minitest::Spec

  should 'provide yml configuration readers for any class' do
    DummyConfig.configure fixtures_root, :foo, :bar, :foo_with_erb, :foo_with_inline_ruby

    assert_equal ['first_value', 'second_value'], DummyConfig.foo.array_value
    assert_equal 'a string', DummyConfig.foo.string_value

    assert_equal ['first_other_value', 'second_other_value'], DummyConfig.bar.another_array_value
    assert_equal 'another string', DummyConfig.bar.another_string_value

    assert_equal 2, DummyConfig.foo_with_erb.a_value_from_erb
    assert_nil DummyConfig.foo_with_erb.should_not_exist

    assert_equal '3', DummyConfig.foo_with_inline_ruby.a_value_from_inline_ruby
  end
end
