class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones

    accepts_nested_attributes_for :phones

end
