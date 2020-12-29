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
FactoryBot.define do
  factory :employee do
    sequence(:name) { |i| "مندوب #{i}" }
    sequence(:email) { |i| "test-#{i}@quire_backend.com" }
    sequence(:mobile) { "0#{rand(505000000..505999999)}" }
    password { "QWer12%!" }
    password_confirmation { "QWer12%!" }
    national_id { "0#{rand(505000000..505999999)}" }
    vehicle_type { "bike" }
    confirmed { false }
    saudi { false }
    bank_name { "elraghi" }
    bank_account_number { rand(1..10) }
    bank_account_holder_name { |n| "#{FFaker::LoremAR.word}_#{n}" }
  end
end
