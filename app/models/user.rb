class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :nickname, presence: true
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :birth, presence: true
         validates :first_name_katakana,presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "はカタカナのみで入力してください" }
         validates :last_name_katakana,presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "はカタカナのみで入力してください" }

         validate :password_format

         private
       
         def password_format
           return if password.blank? # パスワードが空の場合は検証しない
       
           unless password.match(/^(?=.*[a-zA-Z])(?=.*\d).+$/) # 英字と数字が含まれているかを確認
             errors.add(:password, 'は英字と数字の両方を含む必要があります')
           end
          end
end
