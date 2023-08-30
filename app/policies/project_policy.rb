class ProjectPolicy < ApplicationPolicy

  def create?

    user.manager?
  end

  def new?
    create?
  end

  def update?
    user.manager? && record.user == user
  end

  def destroy?
    user.manager? && record.user == user
  end

  def add_developer_qa?
    user.manager? && record.user == user
  end

  def add_user?
    user.manager? && record.user == user
  end

  def remove_user?
    user.manager? && record.user == user
  end
end
