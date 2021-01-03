module Api::V1
  class TasksController < ApplicationController
    def index
      set_project
      response = TaskCreationFromQuireService.call(@project, params[:user_token])
      render json: response, status: :ok
    end

    def daily_overview
      set_project
      TaskCreationFromQuireService.call(@project, params[:user_token])

      today_tasks = Task.due_on_selected_date(Time.zone.today, Time.zone.today)
      today_completed_tasks = Task.due_completed_at_selected_date(Time.zone.today, Time.zone.today)
      render json: {
        today_tasks: today_tasks, today_completed_tasks: today_completed_tasks, today_tasks_count: today_tasks.count, today_completed_tasks_count: today_completed_tasks.count
      }
    end

    # PATCH/PUT /clients/1
    def update
      if @client.update(client_params)
        redirect_to @client, notice: 'Client was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /clients/1
    def destroy
      @client.destroy
      redirect_to clients_url, notice: 'Client was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find_by(quire_id: params[:project_id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:area, :building_number, :email, :latitude, :location, :longitude, :mobile, :name, :neighborhood, :password,
                                     :password_confirmation, :primary_address, :secondary_address, :street)
    end
  end
end
