class CommentPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def permitted_attributes
    if user.present?
      [:content, :post_id]
    else user.editor?
      [:approved]
    end
  end

  def update?
    return unless user.present?
    user.editor? || user.author?
  end

  def delete?
    return unless user.present?
    user.editor?
  end
end
