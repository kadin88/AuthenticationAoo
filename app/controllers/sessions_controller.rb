class SessionsController < ApplicationController
    def new
    end
  
    def create
        if user = User.authenticate_by(email: params[:email], password: params[:password])
            login user
            redirect_to root_path, notice: 'Logado com Sucesso'
        else
            flash[:alert] = 'Email ou Password incorretos.'
            render :new, status: :unprocessable_entity
        end
    end  
  
    def destroy
        logout current_user
        redirect_to root_path, notice: 'Você foi deslogado'
    end
end
