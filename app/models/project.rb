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
class Project < ApplicationRecord
  def self.sync_user_projects(user_token)
    projects_array = []
    response = HTTParty.get("https://quire.io/api/project/list",
                            headers: {
                              'Authorization' => "bearer #{user_token}"
                            }).parsed_response
    response.each do |project|
      projects_array.append({
                              quire_oid: project["oid"],
                              quire_id: project["id"],
                              name: project["nameHtml"]
                            })
    end

    projects_array.each do |item|
      Project.find_or_create_by(item)
    end
  end
end
