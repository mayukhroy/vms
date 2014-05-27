class VendorsController < ApplicationController
  layout :false, :only =>[:new, :edit, :validate_email_exists]
  #layout "false", :only =>[:new]
  #layout :false =>
  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = Vendor.paginate(:page => params[:page], :per_page => 5).order('name ASC')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vendors }
    end
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
    @vendor = Vendor.find(params[:id])
    @services = Service.where(:vendor_id=>@vendor.id)
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vendor }
    end
  end

  # GET /vendors/new
  # GET /vendors/new.json
  def new
    
    @vendor = Vendor.new
    #render :layout =>false
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vendor }
    end
    #render layout: 'none'
    #render :layout => "layouts/header"
  end

  # GET /vendors/1/edit
  def edit
    @vendor = Vendor.find(params[:id])
  end

  # POST /vendors
  # POST /vendors.json
  def create
    @vendor = Vendor.new(params[:vendor])
    @vendor.user_id = current_user.id
    respond_to do |format|
      if @vendor.save
	#Creating services for this vendor
	params[:services] && params[:services].values.each do |service|
		unless service.blank?
			@service = Service.new(:vendor_id => @vendor.id, :name => service)
			@service.save
		end
	end
        #format.html { redirect_to @vendor, notice: 'Vendor was successfully created.' }
	flash[:notice]= 'Vendor was successfully created.'
	format.html { redirect_to action: 'index'}
        format.json { render json: @vendor, status: :created, location: @vendor }
      else
        format.html { render action: "new" }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vendors/1
  # PUT /vendors/1.json
  def update
    @vendor = Vendor.find(params[:id])

    respond_to do |format|
      if @vendor.update_attributes(params[:vendor])
	#Creating services for this vendor
	params[:services].values.each do |service|
		unless service.blank?
			@service = Service.new(:vendor_id => @vendor.id, :name => service)
			@service.save
		end
	end
        #format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
	flash[:notice]= 'Vendor was successfully updated.'
	format.html { redirect_to action: 'index'}
	#redirect_to({ action: 'index' }, alert: "Something serious happened")
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy

    respond_to do |format|
      format.html { redirect_to vendors_url }
      format.json { head :no_content }
    end
  end

  def validate_email_exists
	@is_present_email = Vendor.find_by_email(params[:email]).present?
  end
end
