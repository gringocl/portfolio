class PostPolicy

  attr_accessor :post, :user

  def initialize(post, user)
    @post = post
    @user = user
  end

  def publish?
    @user.role == "editor"
  end

end
