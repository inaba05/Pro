class MachinesController < ApplicationController
  def index
    @machine = Machine.all
  end

  def show
    @machine = Machine.find(params[:id])
  end

  def new
    @machine = Machine.new
  end

  def create
    @machine = Machine.new(model_params)
    if @machine.save
      redirect_to '/machines'
    else
      render 'new'
    end
  end

  def edit
    @machine = Machine.find(params[:id])
  end

  def update
    @machine = Machine.find(params[:id])
    if @machine.update_attributes(model_params)
      # 更新に成功したときの処理
      redirect_to '/machines'
    else
      render 'edit'
    end
  end

  private
  def model_params
    params.require(:machine).permit(:number, :model_id, :from, :to)
  end

end
