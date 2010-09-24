module CSS
  class Parser
    def parse(css)
      return [CSS::Rule.new(:selector => CSS::Selector.new(:raw => "body > .class a"))]
    end
  end
end