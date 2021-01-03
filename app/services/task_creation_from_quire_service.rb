class TaskCreationFromQuireService
  def initialize(project, token)
    @project = project
    @user_token = token
  end

  def self.call(project, token)
    new(project, token).call
  end

  def call
    response = quire_tasks_response
    tasks_array = []
    response.each do |task|
      tasks_array.append({
                           quire_oid: task["oid"],
                           quire_id: task["id"],
                           name: task["nameText"],
                           state: task["status"]["name"],
                           toggled_at: task["toggledAt"],
                           due: task["due"],
                           recurring: task["recurring"].present?
                         })
    end
    tasks_array.each do |item|
      Task.create_with(item).find_or_create_by(
        quire_oid: item[:quire_oid],
        quire_id: item[:quire_id]
      )
    end
    response
  end

  def quire_tasks_response
    project_id = @project.quire_id.delete('"')
    url = "https://quire.io/api/task/list/id/#{project_id}"
    HTTParty.get(url, headers: {
                   'Content-Type' => 'application/json',
                   'Authorization' => "bearer #{@user_token}"
                 }).parsed_response
  end
end
