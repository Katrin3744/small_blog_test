class PostPolicy < ApplicationPolicy
  def delete?
    user.author?(record)
  end
end