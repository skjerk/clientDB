class ClientsController < ApplicationController
    def index
        @title = 'Client Index'
        @breadcrumbs = { "Clients"=>clients_path }
        @clients = Client.all.order(:name)
    end
    
    def show
        @title = 'View Client'
        @client = Client.find(params[:id])
    end

    def new
        @client = Client.new
    end

    def edit
        @client = Client.find(params[:id])
    end

    def create
        # This only works because I've made a clienttype_text
        # getter and setter in the client model, and use clienttype_text
        # In the form dropdown. (thus avoiding the use of ID in the UI)
        @client = Client.new(client_params)

        if @client.save
            redirect_to @client
        else
            render 'new'
        end
    end

    def update
        @client = Client.find(params[:id])
        
        if @client.update(client_params)
            redirect_to @client
        else
            render 'edit'
        end
    end

    def destroy
        @client = Client.find(params[:id])
        @client.destroy

        redirect_to clients_path
    end

    private

    def client_params
        params.require(:client).permit(:name,:cvr,:address,:zip,:city,:phone1,:phone2,:email,:website,:clienttype_text)
    end
end