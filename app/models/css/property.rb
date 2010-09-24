module CSS
  class Property < Tableless
    column :raw, :string
    column :name, :string
    column :value, :string
    belongs_to :rule

    def raw=(string)
      super
      name, *value = string.split(":")
      self.name = name.strip
      self.value = value.join(":").strip
    end

  end
end