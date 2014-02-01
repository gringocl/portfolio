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
      user.editor? || !post.published?
    end
    
    def destroy?
      user.editor? && post.published?
      user.author? && !post.published?
    end
  end
end
