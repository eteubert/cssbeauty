require 'test_helper'
require "css/parser"

class CssParserTest < ActiveSupport::TestCase
  
  def setup
    @parser = CSS::Parser.new
    @css = <<-EOT
      body > .class a { } html, body, p { margin: 0px; }
      p { padding: 0px; }
      #content { font: 12px/normal sans-serif; }
    EOT
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
end