class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  layout false, only: [:get_service_list, :new, :edit, :show, :validate]

  def index
    @empty_project = false
    if params[:change].present? && params[:change].to_i == 1
	    @projects = Project.where(:status => true).paginate(:page => params[:page], :per_page => 15).order(params[:sort]).order('name ASC')	    
	    if !@projects.present?
		    @empty_project = true
	    end
	    
    elsif params[:change].present? && params[:change].to_i == 0
	    @projects = Project.where(:status => false).paginate(:page => params[:page], :per_page => 15).order(params[:sort]).order('name ASC')
	    if !@projects.present?
		    @empty_project = true
	    end
    else		    
	    @projects = Project.paginate(:page => params[:page], :per_page => 15).order(params[:sort]).order('status DESC')
	    if !@projects.present?
		    @empty_project = true
	    end
    end
    
    
    @project = Project.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @vendor = Vendor.find(@project.vendor_id)
    @services_ids = @project.services_ids
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      #~ format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  #def edit
  #  @project = Project.find(params[:id])
  #end

  # POST /projects
  # POST /projects.json
  def create
	#  if request.xhr?
	#	  p "dddddddddddddddddddddddddddddddddd"
	#end
	  
    @project = Project.new(params[:project])
    @project.user_id = current_user.id
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    @current_user = User.find(current_user.id)
    @actual_user = User.find(@project.user_id)

    respond_to do |format|
      if @project.update_attributes(params[:project])
	
	if @project.vendor_id?	
		# assigned services will be saved as 1 (field name: `is_assigned` Table: `services`)
		@project.services_ids.each do |service_id|
			service = Service.find(service_id)
			service.is_assigned = 1
			service.save
		end
		
		# saving the invitation data Table name: `invitations`
		@invitation = Invitation.new()
		@invitation.vendor_id = @project.vendor_id
		@invitation.inviter_id = 1
		@invitation.invitee_id = @actual_user.id
		@invitation.project_id = @project.id
		@invitation.invitation_sent_at = Time.now
		@invitation.save
		
		# Sending mail to currect user, actual user adn vendor
		@project = Project.find(params[:id])
		
		UserMailer.current_user_email(@current_user, @project).deliver
		if @actual_user.id != current_user.id		
			UserMailer.actual_user_email(@actual_user, @project).deliver
		end
		UserMailer.vendor_email(@current_user, @project).deliver
	end
	
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }	
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def assign
	  @project = Project.find(params[:id])
	  @services = Service.all
	  @vendors = Vendor.all
	  @check_service = false
	if @project.services_ids.present?
		@check_service = true
	end
	
	
	  #@name = params[:controller]
	  respond_to do |format|
		format.html # index.html.erb
	  end
  end
  
  def get_service_list	 
	 @vendor_active = true
	@project = Project.find(params[:project_id])
	if Vendor.find(params[:id]).status
		@services = Service.where(vendor_id: params[:id])
	else
		@vendor_active = false
	end	
  end
  
  

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end    
  
  def validate
	  @is_present_project = Project.find_by_name(params[:project_name]).present?
  end  
  
  def change_status
    @project = Project.find(params[:id])
    @project.status = params[:change_to]
    respond_to do |format|
      if @project.update_attributes(params[:project])	
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }	
      else
        format.html { redirect_to projects_path, notice: 'Status not updated. Please try again !' }
      end
    end
  end
  
		  
end
