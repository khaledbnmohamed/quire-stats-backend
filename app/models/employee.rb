# == Schema Information
#
# Table name: employees
#
#  id                       :bigint           not null, primary key
#  avatar                   :string
#  bank_account_holder_name :string
#  bank_account_number      :string
#  bank_name                :string
#  confirmed                :boolean          default(FALSE)
#  email                    :string           not null
#  mobile                   :string           not null
#  name                     :string           not null
#  password_digest          :string
#  saudi                    :boolean          default(TRUE)
#  vehicle_type             :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  national_id              :string
#
# Indexes
#
#  index_employees_on_email   (email) UNIQUE
#  index_employees_on_mobile  (mobile) UNIQUE
#
class Employee < User
end
