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
      unless rule.properties.empty?
        output << rule.selector.raw + " {\n"
        rule.properties.each do |property|
          output << "    " + property.name + ": " + property.value + ";\n"
        end
        output << "}\n"
      end
      output
    end
  end
end