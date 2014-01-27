class Project < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :technologies_used, presence: true, length: {minimum: 30}
end
