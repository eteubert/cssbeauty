module CSS
  class Selector < Tableless
    column :raw, :string
    belongs_to :rule

  end
end