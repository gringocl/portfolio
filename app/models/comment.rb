class Comment < ActiveRecord::Base
  belongs_to :post

  def approve!
    self.approved = true
    save!
  end
end
