class PostPolicy < ApplicationPolicy
  def destroy?
    user.author?(record)
  end
end