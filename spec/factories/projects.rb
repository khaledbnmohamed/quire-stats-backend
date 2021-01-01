# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  name       :string
#  quire_oid  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quire_id   :string
#
FactoryBot.define do
  factory :project do
    name { "MyString" }
    quire_id { "MyString" }
    quire_oid { "MyString" }
  end
end
