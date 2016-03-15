class ModelsController < ApplicationController
  def index
    @model = Model.all
  end

  def show
    @model = Model.find(params[:id])
  end

  def new
    @model = Model.new
  end

  def create
    @model = Model.new(model_params)
    if @model.save
      redirect_to '/models'
    else
      render 'new'
    end
  end

  def edit
    @model = Model.find(params[:id])
  end

  def update
    @model = Model.find(params[:id])
    if @model.update_attributes(model_params)
      # 更新に成功したときの処理
      redirect_to '/models'
    else
      render 'edit'
    end
  end

  private
  def model_params
    params.require(:model).permit(:name)
  end

end
