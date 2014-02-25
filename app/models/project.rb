class Project < ActiveRecord::Base
  has_many :comments, as: :commentable
  validates :name, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :technologies_used, presence: true, length: {minimum: 30}
end
