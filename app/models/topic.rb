class Topic < ApplicationRecord
  belongs_to :textbook, dependent: :destroy
  has_many :t_contents, dependent: :destroy
  has_many :exams, dependent: :destroy
  validates :title, presence: true, length: {maximum: 255}
end
