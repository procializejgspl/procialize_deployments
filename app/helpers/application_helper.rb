module ApplicationHelper
  def user_logged_in?
    !current_user.nil?

  end

  def check_meeters(meeter_array)
    if meeter_array.blank?
      raise "Please Select Atleast one user"
    end
  end

  def check_recipients(recipients_array)
    if recipients_array.blank?
      raise "Please Select Atleast one user"
    end
  end

  def show_meeting_acceptance_link(meeting)
    meeter = meeting.meeters.where("user_id = ?",current_user.id).first
    if !meeter.nil?
    if meeter.status == 0 or meeter.status == 2
     link_to fa_icon("check"), accept_meeting_path(:meeting_id=>meeting.id,:decision=>1)
    end
      end
  end

  def show_meeting_rejection_link(meeting)
    meeter = meeting.meeters.where("user_id = ?",current_user.id).first
    if !meeter.nil?
    if meeter.status == 0 or meeter.status == 1
      link_to fa_icon("trash"), accept_meeting_path(:meeting_id=>meeting.id,:decision=>2)
    end
      end
  end

  def display_date_time(datetime)
    puts datetime.to_date
    if datetime.to_date == DateTime.now.to_date
      "Today at "+datetime.strftime("%H : %M %p")
    else
      if datetime.to_date == Date.yesterday

        "Yesterday at "+ datetime.strftime("%H : %M%p")
      else

      datetime.strftime("%B %-d, %Y")+" at "+ datetime.strftime("%H : %M %p")
    end

    end
    end


  def generate_message_list_link(message)
    r =  Recipient.find_by_message_id(message.id)
    if r.status
      link_to fa_icon("envelope"),mark_message_path(:message_id=>message.id,:mark=>"false",:style=>"color:white")
    else
      link_to fa_icon("envelope"),mark_message_path(:message_id=>message.id,:mark=>"true",:style=>"color:white")
    end
  end


  def question_likes(question)
    #if question.Liked
    #  question.likes.to_s+" like(s)"
    #else
       link_to ("Like("+question.likes.to_s+")"),questionable_path(question)


  end

  def is_user_attending_event?(event_id,user_id)
    a = Attendee.find_by_event_id_and_user_id(event_id,user_id)
    if a.nil?
      false
    else
      true
    end

  end

  def generate_feedback_link(event_id)
    count = Feedback.find_all_by_event_id_and_user_id(event_id,current_user.id).count
    if count ==0
      link_to " Like ",new_feedback_path(:event_id=>event_id),:class => "btn btn-small btn-default",:onclick => 'toggleContent(this,event)'
    else
      link_to " UnLike ",new_feedback_path(:event_id=>event_id),:class => "btn btn-small btn-default",:onclick => 'toggleContent(this,event)'
    end


  end

  def generate_follow_link(user_id)
    if Follower.find_by_user_id_and_follower_id(user_id,current_user.id).nil?
      link_to "Follow",follow_path(:user_id=>@user.id,:decision=>"true"),:class => "btn btn-small btn-default"
    else
      link_to "Unfollow",follow_path(:user_id=>@user.id,:decision=>"false"),:class => "btn btn-small btn-default"
    end
  end



end
