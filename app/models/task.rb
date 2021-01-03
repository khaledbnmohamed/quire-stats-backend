# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  assgine_name :string
#  due          :datetime
#  name         :string
#  quire_oid    :string
#  recurring    :boolean
#  state        :string
#  toggled_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  assigne_id   :string
#  quire_id     :string
#
class Task < ApplicationRecord
  scope :due_on_selected_date, lambda { |start_date, end_date|
    where("DATE(due) >= ? AND DATE(due) <= ?", start_date, end_date)
  }
  scope :done_before_overdue, -> { where("DATE(due) >= toggled_at") }

  scope :due_completed_at_selected_date, lambda { |start_date, end_date|
                                           due_on_selected_date(start_date, end_date).done_before_overdue.where(state: "Completed")
                                         }
end
