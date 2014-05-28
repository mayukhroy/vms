class ServicesController < ApplicationController
	layout :false, :only =>[:new, :edit, :validate_service]

  before_filter :signed_in_user
  
  def index
    @services = Service.paginate(:page => params[:page], :per_page => 15).order(params[:sort]).order('name ASC')
    @vendors = Vendor.order(params[:sort]).order('name ASC')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/1
  # GET /services/1.json
  #def show
    #@service = Service.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @service }
    #end
  #end

  # GET /services/new
  # GET /services/new.json
  def new
    @service = Service.new
    @vendors = Vendor.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/1/edit
  #def edit
  #   @service = Service.find(params[:id])
  #end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(params[:service])

    respond_to do |format|
      if @service.save
        #format.html { redirect_to services_path, notice: 'Service was successfully created.' }
	flash[:notice]= 'Service was successfully created.'
	format.html { redirect_to action: 'index'}
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
     
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        #format.html { redirect_to @service, notice: 'Service was successfully updated.' }
	flash[:notice]= 'Service was successfully updated.'
	format.html { redirect_to action: 'index'}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end
  
  def validate_service
	  @services = Service.where(:vendor_id => params[:vendor_id])
	  @service_name_exist = @services.find_by_name(params[:service_name]).present?
  end 

  private
  def signed_in_user
     if !user_signed_in?
    redirect_to :controller=>'devise/sessions', :action=>'new'
  end       
  end
   
end
