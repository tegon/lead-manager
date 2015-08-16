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

  def salesforce
    @lead = Lead.find(params[:id])
    salesforce_lead = Salesforce::Lead.new(@lead.attributes)

    if salesforce_lead.create(current_user.credentials)
      flash[:success] = 'Lead adicionado ao Salesforce com successo!'
      redirect_to leads_path
    else
      flash[:error] = salesforce_lead.errors.map{ |e| e[:message] }.join(', ')
      redirect_to leads_path
    end
  end

  private
  def lead_params
    params.require(:lead).permit(:name, :last_name, :email, :company, :job_title, :phone, :website)
  end
end