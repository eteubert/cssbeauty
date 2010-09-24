module CSS
  class Parser
    def parse(css)
      result = []
      
      # stip comments
      css.gsub!(/(\/\*.*\*\/)/, '')
      
      rules = css.split("}")
      
      # remove last rule if it is empty
      rules.pop if rules.last.count("{") == 0
      
      # iterate over each rule
      rules.each do |rule|
        selector, raw_properties = rule.split("{")
        properties = raw_properties.split(";")
        
        parsed_properties = []
        properties.each do |property|
          parsed_properties << CSS::Property.new(:raw => property) unless property.count(":") == 0
        end
        
        result << CSS::Rule.new(
          :selector   => CSS::Selector.new(:raw => selector.strip),
          :properties => parsed_properties
        )
      end
      
      return result
    end
  end
end