module CSS
  class Parser
    def parse(css)
      result = []
      
      rules = css.split("}")
      
      # remove last rule if it is empty
      rules.pop if rules.last.count("{") == 0
      
      # iterate over each rule
      rules.each do |rule|
        selector, attributes = rule.split("{")
        result << CSS::Rule.new(:selector => CSS::Selector.new(:raw => selector.strip))
      end
      
      return result
    end
  end
end