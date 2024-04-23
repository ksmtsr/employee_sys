class Employee < ApplicationRecord
    has_many :documents, dependent: :destroy
end
