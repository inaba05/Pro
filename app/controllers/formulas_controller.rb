class FormulasController < ApplicationController
  def index
    @formula = Formula.all
  end

  def show
    @formula = Formula.find(params[:id])
  end

  def new
    @formula = Formula.new
  end

  def create
    @formula = Formula.new(model_params)
    if @formula.save
      redirect_to '/formulas'
    else
      render 'new'
    end
  end

  def edit
    @formula = Formula.find(params[:id])
  end

  def update
    @formula = Formula.find(params[:id])
    if @formula.update_attributes(model_params)
      # 更新に成功したときの処理
      redirect_to '/formulas'
    else
      render 'edit'
    end
  end

  private
  def model_params
    params.require(:formula).permit(:model_id, :criteria, :big, :reg, :roll)
  end

end
