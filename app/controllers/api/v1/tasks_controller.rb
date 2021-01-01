module Api::V1
  class TasksController < ApplicationController
    def index
      set_project
      project_oid = @project.quire_id.delete('"')
      url = "https://quire.io/api/task/list/id/#{project_oid}"
      response = HTTParty.get(url,
                              headers: {
                                'Content-Type' => 'application/json',
                                'Authorization' => "bearer #{params[:user_token]}"
                              }).parsed_response
      render json: response, status: :ok
    end

    # GET /clients/1
    def show
      authorize @client
      raise ArgumentError, client.errors.messages unless @client

      render json: ClientBlueprint.render(@client), status: :ok
    end

    # GET /clients/1/edit
    def edit
    end

    # POST /clients
    def create
      skip_authorization

      client = Client.new(client_params)

      raise Errors::CustomError.new(:bad_request, 400, client.errors.messages) unless client.save

      render json: ClientBlueprint.render(client), status: :ok
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
