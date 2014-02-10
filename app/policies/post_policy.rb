class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user == nil
        scope.where(published: true)
      elsif user.author?
        scope.where(author.id == user.id)
      else user.editor?
        scope
      end
    end
  end

  def create?
    user.author? || user.editor?
  end

  def publish?
    user.editor? || !post.published?
  end

  def update?
    return unless user.present?
    user.editor?
  end

  def destroy?
    user.editor? && post.published?
    user.author? && !post.published?
  end
end
