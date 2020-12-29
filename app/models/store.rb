# == Schema Information
#
# Table name: stores
#
#  id              :bigint           not null, primary key
#  avatar          :string
#  email           :string           not null
#  latitude        :string
#  location        :string
#  longitude       :string
#  mobile          :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  primary_address :string           not null
#
class Store < User
end
