class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_questions, through: :likes, source: :question

  def already_liked?(question)
    self.likes.exists?(question_id: question.id)
  end

  with_options presence: true do
  validates :password, format: { with: /\A[a-z0-9]+\z/ , message: ' 半角英数字で入力してください' }
  validates :name
  end
end
