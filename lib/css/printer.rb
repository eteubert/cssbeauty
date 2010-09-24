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
          values = property.values.collect do |v|
            # write 0 instead of 0<unit>
            (v.value.match(/^\d/) && v.value.to_i === 0) ? 0 : v.value
          end
          output << "    " + property.name + ": " + values.join(" ") + ";\n"
        end
        output << "}\n"
      end
      output
    end
  end
end