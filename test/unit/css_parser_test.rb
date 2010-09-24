require 'test_helper'
require "css/parser"

class CssParserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "parser finds css selector in one rule" do
    css = "body > .class a { }";
    parser = CSS::Parser.new
    result = parser.parse(css)
    
    assert_instance_of(CSS::Rule, result.first)
    assert_equal("body > .class a", result.first.selector.raw)
  end
end