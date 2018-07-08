class ClienttypesController < ApplicationController
    def index
        @title = 'Client Types Index'
        @breadcrumbs = { "Client Types"=>clienttypes_path }
        @clienttypes = Clienttype.all.order(:text)
    end
    
    def show
        @title = 'View Client Type'
        @clienttype = Clienttype.find(params[:id])
    end

    def new
        @clienttype = Clienttype.new
    end

    def edit
        @clienttype = Clienttype.find(params[:id])
    end

    def create
        @clienttype = Clienttype.new(clienttype_params)

        if @clienttype.save
            #redirect_to @clienttype
            redirect_to clienttypes_path
        else
            render 'new'
        end
    end

    def update
        @clienttype = Clienttype.find(params[:id])
        
        if @clienttype.update(clienttype_params)
            #redirect_to @clienttype
            redirect_to clienttypes_path
        else
            render 'edit'
        end
    end

    def destroy
        @clienttype = Clienttype.find(params[:id])
        @clienttype.destroy
        flash[:success] = 'The clienttype has been deleted'
        redirect_to clienttypes_path
    end

private
    def clienttype_params
        params.require(:clienttype).permit(:text)
    end
end
