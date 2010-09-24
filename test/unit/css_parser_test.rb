require 'test_helper'
require "css/parser"

class CssParserTest < ActiveSupport::TestCase
  
  def setup
    @parser = CSS::Parser.new
    @css = <<-EOT
      body > .class a { } html, body, p { margin: 0px; display: block; }
      p { padding: 0px; }
      #content { font: 12px/normal sans-serif; }
    EOT
  end
  
  test "parser can handle background urls" do
    @css = "#content { background: url(http://foo.bar/baz) }"
    result = @parser.parse(@css)
    assert_equal("url(http://foo.bar/baz)", result.first.properties.first.value)
  end
  
  test "parser finds css selector in one rule" do
    result = @parser.parse(@css)
    
    assert_instance_of(CSS::Rule, result.first)
    assert_equal("body > .class a", result.first.selector.raw)
  end
  
  test "parser finds all selectors" do
    result = @parser.parse(@css)
    
    selectors = 
    [
      "body > .class a",
      "html, body, p",
      "p",
      "#content"
    ]
    
    assert_equal(selectors, result.collect{ |rule| rule.selector.raw })
  end
  
  test "parser finds properties" do
    result = @parser.parse(@css)
    
    assert_equal("margin", result.second.properties.first.name)
    assert_equal("0px", result.second.properties.first.value)
    assert_equal("display", result.second.properties.second.name)
    assert_equal("block", result.second.properties.second.value)
    assert_equal("padding", result.third.properties.first.name)
    assert_equal("font", result.fourth.properties.first.name)
  end
end