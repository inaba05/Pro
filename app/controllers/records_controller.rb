class RecordsController < ApplicationController
  def index
    if params[:sel_day].blank? then
      day = Time.now.strftime("%Y-%m-%d")
    else
      sel_day = params[:sel_day]
      day = sel_day['day']
    end
    @record = Record.where("date = :date" ,date: day)
    # @record = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(model_params)

    machine = Machine.where("id = :id" , id: params[:machine_id])
    formula = Formula.where("model_id = :model_id" ,model_id: 1).order("criteria")

    formula.each do |f|
      get    = (@record.big * f.big + @record.reg * f.reg)
      rost   = (@record.roll / f.roll).floor * 50
      result = get - rost
      case f.criteria
      when 1 then
        @record.dry = result
      when 2 then
        @record.result = result
      when 3 then
        @record.sweet = result
      end
    end

    if @record.save
      redirect_to '/records'
    else
      render 'new'
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update_attributes(model_params)
      # 更新に成功したときの処理
      redirect_to '/records'
    else
      render 'edit'
    end
  end

  private
  def model_params
    params.require(:record).permit(:machine_id,:date,:big,:reg,:art,:roll,:final_roll,:sel_day)
  end

end
