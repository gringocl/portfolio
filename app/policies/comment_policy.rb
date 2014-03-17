class CommentPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def permitted_attributes
    if !user.nil? && user.editor?
      [:author, :author_url, :author_email, :content, :referrer, :commentable_id, :approved]
    else
      [:author, :author_url, :author_email, :content, :referrer, :commentable_id ]
    end
  end

  def create?
    user.present?
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
