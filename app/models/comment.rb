class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  validates :content, presence: true

  def approve!
    self.approved = true
    save!
  end
end
