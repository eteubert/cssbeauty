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
end