class Api::V1::WelcomesController < ApplicationController
  skip_before_action :authorized, only: [:index]

    def index
        render json: { message: 'Hello,world! This is our development branch' }
      end
      
end

