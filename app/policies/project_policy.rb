class ProjectPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def update?
    return unless user.present?
    user.editor?
  end

end
