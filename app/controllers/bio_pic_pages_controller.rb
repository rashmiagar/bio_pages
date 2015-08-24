class BioPicPagesController < ApplicationController
  before_action :set_user

  def edit
  	@user = User.find(params[:id])
  	@projects = Project.all_except(@user.projects)
    @autocomplete_items = Skill.pluck(:name)
  end

  def show

  	@user_mastered_skills = @user.skills.group_by{|skill| skill.user_skill(@user.id).mastered}[true]
  	@user_learning_skills = @user.skills.group_by{|skill| skill.user_skill(@user.id).mastered}[false]
  end
  
  def update
  	@user = User.find(params[:id])
    @user.update_columns({:designation => params["bio_pic_pages"]["user"]["designation"], :education_qualification => params["bio_pic_pages"]["user"]["education_qualification"]})

  	skills = params[:bio_pic_pages][:user_skills]

    # has_many through
  	begin
      skills.each do |key, value|
        name = value["name"]
        skill_db_object = Skill.find_by_name(name)
        if !skill_db_object.present? 
          skill = Skill.create(name: name, :category_id => value["category_id"].to_i)
          @user.user_skills.create!(:skill_id => skill.id, :mastered => value["mastered"] == "true" ? 0 : 1, :description => value["description"])
        else
          @user.user_skills.create!(:skill_id => skill_db_object.id, :mastered => value["mastered"] == "true" ? 0 : 1, :description => value["description"])

        end
      end
      # HABTM  projects_users table
      if params[:bio_pic_pages].has_key?(:user_projects)
        selected_projects = Project.where(:id => [params[:bio_pic_pages][:user_projects]])
        selected_projects.each do |selected_project|
          @user.projects << selected_project if !@user.projects.include?(selected_project)
        end
      end

      flash[:message] = "Profile updated successfully"
      redirect_to show_bio_pic_page_path(@user.id), :notice => "User Bio Pic Page updated successfully."

    rescue ActiveRecord::RecordInvalid => e
      flash[:errors] = e.message
      redirect_to edit_bio_pic_page_path(@user.id)
    end
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
