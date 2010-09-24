module CSS
  class Value < Tableless
    column :value, :string
    belongs_to :property

  end
end