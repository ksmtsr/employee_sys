require 'rails_helper'

RSpec.describe Document, type: :model do
    let(:employee) { create(:valid_employee) }

    describe 'バリデーション' do
      it '説明が存在すること' do
        document = build(:document, employee: employee)
        expect(document).to be_valid
      end
    end

  describe '関連付け' do
    it 'Employeeモデルと関連付けられていること' do
      association = described_class.reflect_on_association(:employee)
      expect(association.macro).to eq :belongs_to
    end
  end
end
