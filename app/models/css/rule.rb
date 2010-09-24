module CSS
  class Rule < Tableless
    has_one :selector
    has_many :properties

  end
end