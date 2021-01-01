module Api::V1
  class ProjectsController < ApplicationController
    def index
      response = HTTParty.get(
        "https://quire.io/api/task/list/#{params[:id]}",
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => "bearer #{params[:user_token]}"
        }
      ).parsed_response
      render json: response, status: :ok
    end

    def show
      response = HTTParty.get(
        "https://quire.io/api/project/id/#{params[:id]}",
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => "bearer #{params[:user_token]}"
        }
      ).parsed_response
      render json: response, status: :ok
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
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:area, :building_number, :email, :latitude, :location, :longitude, :mobile, :name, :neighborhood, :password,
                                     :password_confirmation, :primary_address, :secondary_address, :street)
    end
  end
end
