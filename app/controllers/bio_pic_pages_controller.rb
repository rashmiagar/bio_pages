class BioPicPagesController < ApplicationController
  before_action :set_user
  def new
  end

  def edit
  	@user = current_user
  	@skill = @user.skills.build
  	@user_skill = @user.user_skills.build(:skill => @skill)
  	@projects = Project.all_except(@user.projects)
    @autocomplete_items = Skill.pluck(:name)
  end

  def show
  	@user_mastered_skills = @user.skills.group_by{|skill| skill.user_skill.mastered}[true]
  	@user_learning_skills = @user.skills.group_by{|skill| skill.user_skill.mastered}[false]
  end
  
  def update
  	@user = current_user 
  
  	puts params[:user][:education_qualification]
  	puts params[:user][:skills_attributes]
  	puts params[:user][:skills_attributes][:user_skills]
  	puts params[:user][:projects_attributes]
  

  	if params[:user][:education_qualification].present?
      @user.update_attributes!(:education_qualification => params[:user][:education_qualification])
    end
    if params[:user][:designation].present?
      @user.update_attributes(:designation => params[:user][:designation])
    end

  	skill_array = params[:user][:skills_attributes]

    # has_many through
  	begin
  	  unless skill_array["0"][:name].empty?
	    skill_array.size.times do |i|
		  skill = Skill.find_or_create_by(name: skill_array[i.to_s][:name]) do |skill|
			skill.category_id = skill_array[i.to_s][:category_id]
		  end
		
		  @user.user_skills.create!(:skill_id => skill.id, :mastered => skill_array[i.to_s][:user_skills][:mastered], :description => skill_array[i.to_s][:user_skills][:description])

		  # HABTM projects_skills table
		  skill.project_ids << skill_array[i.to_s][:project_attributes][:project_id]
	    end
      end
  rescue ActiveRecord::RecordInvalid => e
  	flash[:errors] = e.message
  	render 'edit'
  end
  
  # HABTM  projects_users table
  if params[:user].has_key?(:projects_attributes)
    params[:user][:projects_attributes].size.times do |id| 
      @user.projects << Project.find(params[:user][:projects_attributes][id.to_s][:id])
    end
  end

    flash[:message] = "Profile updated successfully"
    render 'edit'
  end

 private
 def set_user
 	@user = User.find_by_id(params[:id])
 	redirect_to root_url, :notice => "Invalid User ID" if @user.nil?
 end

 def project_params
   params.require(:user).permit(:skills_attributes, :projects_attributes, :education_qualification, :designation)
 end

end
