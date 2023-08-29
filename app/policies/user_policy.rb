class UserPolicy < ApplicationPolicy
  def manager?
   user.user_type == 'Manager'

  end

  def developer?
    user.user_type == 'Developer'
  end

  def qa?
    user.user_type == 'Qa'
  end
end
