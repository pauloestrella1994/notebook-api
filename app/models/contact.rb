class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones

    accepts_nested_attributes_for :phones

    def kind_description
        self.kind.description
    end

    def as_json(options={})
        super(
            root: true,
            methods: [:kind_description]
        )
    end
end
