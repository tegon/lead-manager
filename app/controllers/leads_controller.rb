class LeadsController < ApplicationController
  before_filter :authenticate!

  def index
    @leads = Lead.all
  end

  def show
    @lead = Lead.find(params[:id])
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)

    if @lead.save
      flash[:success] = 'Lead criado com sucesso!'
      redirect_to leads_path
    else
      render action: :new
    end
  end

  def edit
    @lead = Lead.find(params[:id])
  end

  def update
    @lead = Lead.find(params[:id])

    if @lead.update_attributes(lead_params)
      flash[:success] = 'Lead atualizado com sucesso!'
      redirect_to leads_path
    else
      render action: :edit
    end
  end

  def destroy
    @lead = Lead.find(params[:id])

    if @lead.destroy
      flash[:success] = 'Lead apagado!'
      redirect_to leads_path
    else
      render action: :index
    end
  end

  private
  def lead_params
    params.require(:lead).permit(:name, :last_name, :email, :company, :job_title, :phone, :website)
  end
end