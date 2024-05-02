require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'バリデーション' do
    it '姓と名のカナ形式を検証する' do
      expect('カタカナ').to match(/\A[\p{katakana}\p{blank}ー－]+\z/)
      expect('ひらがな').not_to match(/\A[\p{katakana}\p{blank}ー－]+\z/)
    end
  end

  describe 'メソッド' do
    let(:employee) { create(:employee, first_name: '太郎', last_name: '田中', first_name_kana: 'タロウ', last_name_kana: 'タナカ', birthday: Date.new(1990, 1, 1), postal_code: '1234567', address: '東京都渋谷区') }

    it 'フルネームを返す' do
      expect(employee.full_name).to eq('田中太郎')
    end

    it 'フルネームのカナを返す' do
      expect(employee.full_name_kana).to eq('タナカタロウ')
    end

    it '年齢を計算する' do
      expect(employee.age).to eq((Date.today - employee.birthday).to_i / 365)
    end

    it '郵便番号付きの住所を表示する' do
      expect(employee.address_display).to eq('〒1234567 東京都渋谷区')
    end
  end
end
