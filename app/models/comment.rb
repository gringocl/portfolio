class Comment < ActiveRecord::Base
  belongs_to :post
  validates :content, presence: true

  def approve!
    self.approved = true
    save!
  end
end
