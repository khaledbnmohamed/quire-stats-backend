# == Schema Information
#
# Table name: clients
#
#  id                :bigint           not null, primary key
#  area              :string
#  avatar            :string
#  building_number   :string
#  email             :string           not null
#  latitude          :string
#  location          :string
#  longitude         :string
#  mobile            :string           not null
#  name              :string           not null
#  neighborhood      :string
#  password_digest   :string           not null
#  primary_address   :string           not null
#  secondary_address :string
#  street            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Client < User
end
