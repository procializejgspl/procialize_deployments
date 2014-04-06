#This is the controller which is used for landing page.
#A root method will check if user is logged in or not and display the page accordingly

class WelcomeController < ApplicationController
  def index
    @tweets = Customizer.gettweets()
    @feeds = Feed.all.reverse!
    @users = User.all

  end

  def view_all_users
    @users = User.all

  end

  def build_recommend
    Recommend.destroy_all


    User.all.each do |u|
      if !u.interest=""
        @user_recommend=User.find_all_by_industry(u.interest).shuffle[0..2]-[u]
        @user_recommend.each do |ur|
          @recommend=Recommend.create(:user_id => u.id, :recommended_id => ur.id)
        end
        if @user_recommend.count < 3
          (3 - @user_recommend.count).times do |i|
            cu = (User.all - @user_recommend)[0]
            @recommend=Recommend.create(:user_id => u.id, :recommended_id => cu.id)

          end
        end

      elsif !u.industry="" and u.interest=""
        @user_recommend=User.find_all_by_industry(u.industry).shuffle[0..2]-[u]
        @user_recommend.each do |ur|
          @recommend=Recommend.create(:user_id => u.id, :recommended_id => ur.id)
        end
        if @user_recommend.count < 3
          (3 - @user_recommend.count).times do |i|
            cu = (User.all - @user_recommend)[0]
            @recommend=Recommend.create(:user_id => u.id, :recommended_id => cu.id)

          end
        end

      elsif !u.location="" and u.interest="" and u.industry=""
        @user_recommend=User.find_all_by_location(u.location).shuffle[0..2]-[u]
        @user_recommend.each do |ur|
          @recommend=Recommend.create(:user_id => u.id, :recommended_id => ur.id)
        end
        if @user_recommend.count < 3
          (3 - @user_recommend.count).times do |i|
            cu = (User.all - @user_recommend)[0]
            @recommend=Recommend.create(:user_id => u.id, :recommended_id => cu.id)

          end
        end


      else
        @user_recommend=User.all.shuffle[0..2] - [u]
        @user_recommend.each do |ur|
          @recommend=Recommend.create(:user_id => u.id, :recommended_id => ur.id)
        end
        if @user_recommend.count < 3
          (3 - @user_recommend.count).times do |i|
            cu = (User.all - @user_recommend)[0]
            @recommend=Recommend.create(:user_id => u.id, :recommended_id => cu.id)

          end
        end

      end
    end


    render :text => "Done"
    return
  end


  def user_profile
    v = Viewer.find_by_user_id_and_viewed_by(params[:id], current_user.id)
    if v.nil?
      v = Viewer.create!(:user_id => params[:id], :viewed_by => current_user.id)
    end
    v.count=v.count+1
    v.save!

    #adding internal analytics
    performed_on = User.find(params[:id]).name
    data=Analytic.find_by_performed_by_and_performed_on_and_action(current_user.name, performed_on,'Viewed profile of')
    if data.nil?
      data = Analytic.create!(performed_by: current_user.name, action: 'Viewed profile of', performed_on: performed_on)
    end

    data.count=data.count+1
    data.save!

    @user = User.find(params[:id])
    @feeds=@user.feeds
    @tweets = Customizer.gettweets()
    @user_employees = @user.employees.map { |e| e.people }
    render "welcome/user_profile", :layout => false
  end

  def bannerclick
    #adding internal analytics
    perfomed_on = AdvLogos.find(params[:ad_id]).name
    data = Analytic.find_by_performed_by_and_performed_on(current_user.name, perfomed_on)
    if data.nil?
      data = Analytic.create!(performed_by: current_user.name, action: 'Clicked Advertisement', performed_on: perfomed_on)
    end
    data.count=data.count+1
    data.save!
    render text: ''
  end

  def download_brochure
    performed_on = User.find(params[:user_id]).name
    data=Analytic.find_by_performed_by_and_performed_on_and_action(current_user.name, performed_on,'Downloaded the Brochure of')
    if data.nil?
      data=Analytic.create!(performed_by: current_user.name, action: 'Downloaded the Brochure of', performed_on: performed_on)
    end
    data.count=data.count+1
    data.save!
    render text: ''
  end

  def follow
    if params[:decision] =="true"
      Follower.create!(:user_id => params[:user_id], :follower_id => current_user.id)
      notice = "You are now following "+User.find(params[:user_id]).name
    else
      Follower.find_by_user_id_and_follower_id(params[:user_id], current_user.id).destroy
      notice = "You are now not following "+User.find(params[:user_id]).name
    end

    redirect_to root_path, :notice => notice

  end


  def display_menu
    render "welcome/_menu_items", :layout => false
  end


  def user_based_on_roles
    @users= Role.find(params[:id]).users
    @user = @users[0]
    @feeds=@user.feeds

    @tweets = Customizer.gettweets()
    @user_employees = @user.employees.map { |e| e.people }

  end
end


