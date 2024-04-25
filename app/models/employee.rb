class Employee < ApplicationRecord
    # has_many :documents, dependent: :destroy
    has_many_attached :documents

    def full_name
        self.last_name + self.first_name
    end

    def full_name_kana
        self.last_name_kana + self.first_name_kana
    end

    def age
        (Date.today - birthday).to_i / 365
    end
      


    def address_display
        "〒" + postal_code + " " + address
    end
end
