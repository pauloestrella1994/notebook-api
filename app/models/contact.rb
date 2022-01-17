class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones

    accepts_nested_attributes_for :phones

    def kind_description
        self.kind.description
    end

    def to_br
        {
            name: self.name,
            email: self.email,
            birthday: (I18n.l(self.birthday) unless self.birthday.blank?),
            created_at: self.created_at,
            updated_at: self.updated_at,
            kind: self.kind_description
        }
    end

    def as_json(options={})
        super(
            root: true,
            methods: [:kind_description]
        )
    end
end
