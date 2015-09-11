module PmBonusCoefficients
  extend self

  def base_percent
    4
  end

  def complaints
    -100
  end


  def critical_complaints
    -250
  end

  def letters_of_thanks
    500
  end

  def deadline_bonus_coefficients
    {
      pm_ahead_of_schedule: 1.5,
      pm_in_time: 1,
      pm_delayed_by_2_weeks_fault_customer: 1,
      pm_delayed_by_2_weeks_fault_company: -0.5,
      pm_delayed_by_4_weeks_fault_company: -1,
    }
  end
end