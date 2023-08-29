class BugPolicy < ApplicationPolicy
  def create?
    user.manager?
  end

  def update?
    user.manager? && record.project.user == user
  end

  def destroy?
    user.manager? && record.project.user == user
  end

  def assign_to_self?
    user.developer? && user.projects.include?(record.project)
  end

  def mark_resolved?
    user.developer? && user.projects.include?(record.project)
  end

  def report_bug?
    user.qa?
  end
end
