class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  layout false, only: [:get_service_list]

  def index
    @projects = Project.all
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
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
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
		@invitation = Invitations.new()
		@invitation.vendor_id = @project.vendor_id
		@invitation.inviter_id = current_user.id
		@invitation.invitee_id = @actual_user.id
		@invitation.project_id = @project.id
		@invitation.invitation_sent_at = Time.now
		@invitation.save
		
		# Sending mail to currect user, actual user adn vendor
		@project = Project.find(params[:id])
		
		UserMailer.current_user_email(@current_user, @project).deliver
		UserMailer.actual_user_email(@actual_user, @project).deliver
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
	  @project = Project.find(params[:project_id])
	  @services = Service.where(vendor_id: params[:id])
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
end
