class ModuleCodeObject < CodeObject
  has_many :classes_and_modules,
    -> { where(type: ["ModuleCodeObject", "ClassCodeObject"]).order(:name) },
    class_name: "CodeObject",
    foreign_key: :namespace_id

  has_many :modules, class_name: "ModuleCodeObject", foreign_key: :namespace_id
  has_many :classes, class_name: "ClassCodeObject", foreign_key: :namespace_id
  has_many :constant_objects, class_name: "ConstantCodeObject", foreign_key: :namespace_id
  has_many :method_objects, -> { where(is_attribute: false) },
    class_name: "MethodCodeObject", foreign_key: :namespace_id do
    def public
      where(visibility: "public")
    end
  end
end
