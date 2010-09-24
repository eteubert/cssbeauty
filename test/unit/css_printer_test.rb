require 'test_helper'
require "css/parser"
require "css/printer"

class CssPrinterTest < ActiveSupport::TestCase
  def setup
    @parser = CSS::Parser.new
    @css = <<-EOT
      body > .class a { } html, body, p { margin: 0px; display: block; }
      p { padding: 0px; }
      #content { font: 12px/normal sans-serif; }
    EOT
    @rules = @parser.parse(@css)
    @printer = CSS::Printer.new
  end  
  
  test "printer prints a beautiful block" do
    output = @printer.format_rule(@rules.second)
    expected = <<-EOT 
html, body, p {
    margin: 0px;
    display: block;
}
    EOT
    
    assert_equal(expected, output)
  end
end