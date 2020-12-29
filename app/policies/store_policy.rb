class StorePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    true
  end

  def index?
    true
  end

  def show?
    (user.is_a?(AdminUser) || store?) && (index? || (record.id == user.id))
  end

  def update?
    user.id == record.id
  end

  def reset_password?
    user.id == record.id
  end

  def update_password?
    user.id == record.id
  end

  def destroy?
    user.id != record.id
  end

  private

  def store?
    user.is_a?(Store)
  end
end
