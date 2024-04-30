class Employee < ApplicationRecord
    has_many :documents, dependent: :destroy
    

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

    validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
    validates :postal_code, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
                  format: { with: /\A[0-9]+\z/ }


end
