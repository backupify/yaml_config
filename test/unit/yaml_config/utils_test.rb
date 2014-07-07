require_relative '../../helper'

module YamlConfig

  class UtilsTest < Minitest::Spec

    should 'read yml from file' do
      yml_data = Utils.from_file(fixtures_root + "/foo.yml")

      assert_equal ['first_value', 'second_value'], yml_data.array_value
      assert_equal 'a string', yml_data.string_value
    end

    should 'read yml from file and evaluate erb' do
      yml_data = Utils.from_file(fixtures_root + "/foo-with-erb.yml")

      assert_equal 2, yml_data.a_value_from_erb
      assert_nil yml_data.should_not_exist
    end

    should 'read yml from file and evaluate inline ruby' do
      yml_data = Utils.from_file(fixtures_root + "/foo-with-inline-ruby.yml")

      assert_equal '3', yml_data.a_value_from_inline_ruby
    end

  end

end
