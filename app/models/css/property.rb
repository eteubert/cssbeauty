module CSS
  class Property < Tableless
    column :raw, :string
    column :name, :string
    column :value, :string
    belongs_to :rule
    has_many :values

    def raw=(string)
      super
      name, *value = string.split(":")
      self.name = name.strip
      self.value = value.join(":").strip
      self.value.scan(/\S*\(.*\)|\S+/).each do |v|
        self.values << CSS::Value.new(:value => v)
      end
    end

  end
end