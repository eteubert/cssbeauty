require 'test_helper'
require "css/parser"
require "css/printer"

class CssPrinterTest < ActiveSupport::TestCase
  def setup
    @parser = CSS::Parser.new
    @css = <<-EOT
      body > .class a { } html, body, p { margin: 0px; display: block; }
      p { padding: 0px; } /* some comment */
      #content { font: 12px/normal sans-serif; }
    EOT
    @rules = @parser.parse(@css)
    @printer = CSS::Printer.new
  end  
  
  test "printer prints a beautiful block" do
    output = @printer.format_rule(@rules.second)
    expected = <<-EOT 
html, body, p {
    margin: 0;
    display: block;
}
    EOT
    
    assert_equal(expected, output)
  end
  
  test "printer omits empty rules" do
    output = @printer.format_rule(@rules.first)
    assert_equal("", output)
  end
  
  test "dont nullify fractions" do
    @parser = CSS::Parser.new
    @css = <<-EOT
      a { border-width: 0.8px; }
    EOT
    @rules = @parser.parse(@css)
    output = @printer.format_rule(@rules.first)

    expected = <<-EOT 
a {
    border-width: 0.8px;
}
    EOT

        assert_equal(expected, output)
  end
  
  test "printer prints multiple beautiful blocks" do
    @rules.shift # remove first element, we test it separately
    output = @printer.format_all(@rules)
    expected = <<-EOT 
html, body, p {
    margin: 0;
    display: block;
}

p {
    padding: 0;
}

#content {
    font: 12px/normal sans-serif;
}

        EOT

    assert_equal(expected, output)    
  end
end