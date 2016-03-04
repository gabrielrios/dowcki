class ClassCodeObject < ModuleCodeObject
  has_many :attribute_methods,
    -> { where(type: "MethodCodeObject", is_attribute: true).order(:name) },
    foreign_key: :namespace_id
end
