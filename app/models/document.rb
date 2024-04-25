class Document < ApplicationRecord
    
    belongs_to :employee
    has_many_attached :files

end
