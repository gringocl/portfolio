class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.editor?
        scope
      else
        scope.where(published: true)
      end
    end

    def create?
      user.author?
    end

    def publish?
      user.editor? or not post.published?
    end
  end
end
