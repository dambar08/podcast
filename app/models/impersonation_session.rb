class ImpersonationSession < ApplicationRecord
  belongs_to :impersonator, class_name: "User"
  belongs_to :impersonated, class_name: "User"

  enum :status, { pending: "pending", in_progress: "in_progress", complete: "complete", rejected: "rejected" }

  scope :initiated, -> { where(status: [ :pending, :in_progress ]) }

  validate :impersonator_is_super_admin
  validate :impersonated_is_not_super_admin
  validate :impersonator_different_from_impersonated

  def approve!
    update! status: :in_progress
  end

  def reject!
    update! status: :rejected
  end

  def complete!
    update! status: :complete
  end

  private
    def impersonator_is_super_admin
      errors.add(:impersonator, "must be a super admin to impersonate") unless impersonator.has_role?(:super_admin)
    end

    def impersonated_is_not_super_admin
      errors.add(:impersonated, "cannot be a super admin") if impersonated.has_role?(:super_admin)
    end

    def impersonator_different_from_impersonated
      errors.add(:impersonator, "cannot be the same as the impersonated user") if impersonator == impersonated
    end
end
