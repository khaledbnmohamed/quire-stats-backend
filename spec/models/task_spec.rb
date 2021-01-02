# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  assgine_name :string
#  due          :date
#  name         :string
#  quire_oid    :string
#  recurring    :boolean
#  state        :string
#  toggled_at   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  assigne_id   :string
#  quire_id     :string
#
require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
