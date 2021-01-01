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
require 'rails_helper'

RSpec.describe Project, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
