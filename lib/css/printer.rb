module CSS
  class Printer
    def format_rule(rule)
      output = ""
      output << rule.selector.raw + " {\n"
      rule.properties.each do |property|
        output << "    " + property.name + ": " + property.value + ";\n"
      end
      output << "}\n"
      output
    end
  end
end