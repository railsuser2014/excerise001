class CarsController < ApplicationController
  
  skip_before_action :authorize
  
  def index
    @cars = Car.all
  end
  
  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  
  def car_params
    params.require(:car).permit(:manufacturer)
  end
  
end
