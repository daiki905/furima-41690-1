class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :nickname, presence: true
         validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角文字で入力してください" }
         validates :last_name, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角文字で入力してください" }
         validates :birth, presence: true
         validates :first_name_katakana,presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "はカタカナのみで入力してください" }
         validates :last_name_katakana,presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "はカタカナのみで入力してください" }

         validate :password_format

         has_many :items

         private
       
         def password_format
           return if password.blank? # パスワードが空の場合は検証しない
       
           unless password.match(/\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/)
             errors.add(:password, 'は英字と数字の両方を含む必要があります')
           end
          end
end
