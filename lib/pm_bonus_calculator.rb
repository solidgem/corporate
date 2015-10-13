module PmBonusCalculator
  module_function

  def perform(project, rest)
    overdue = project.finished_at.beginning_of_day - project.deadline.beginning_of_day

    base_coefficient = 0.04
    bonus_coefficient =
        if overdue < 0.days
          0.015
        elsif overdue == 0.days
          0.01
        elsif overdue <= 2.weeks && project.overdue_kind == 'customer_fault'
          0.01
        elsif overdue <= 4.weeks && project.overdue_kind == 'customer_fault'
          -0.005
        elsif overdue <= 2.weeks && project.overdue_kind == 'company_fault'
          -0.005
        elsif overdue <= 4.weeks && project.overdue_kind == 'company_fault'
          -0.005
        else
          -0.01
        end
    bonus = rest * (base_coefficient + bonus_coefficient)
    bonus -= project.complaints.to_i * 100
    bonus -= project.critical_complaints.to_i * 250
    bonus += 500 if project.letters_of_thanks
    bonus
  end
end
