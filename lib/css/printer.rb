module CSS
  class Printer
    def format_all(rules)
      output = ""
      rules.each do |rule|
        output << format_rule(rule)
        output << "\n"
      end
      output
    end
    
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