class FoodsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @foods Food.find_by(user_id: params[:id])
  end

  def show
    @user = User.find(params[:user_id])
    @foods Food.find_by(id: params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if food.save
      flash[:success] = 'Food successfully added'
      redirect_to user_foods_path(current_user, @food)
    else
      flash.now[:error] = 'Food was not added successfully'
      render :new
    end
    end
  end

  def destroy
  end
  
  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
