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
FactoryBot.define do
  factory :task do
    name { "MyString" }
    quire_id { "MyString" }
    quire_oid { "MyString" }
    due { "2021-01-01" }
    toggled_at { "2021-01-01" }
    assgine_name { "MyString" }
    assigne_id { "MyString" }
    state { "MyString" }
  end
end
