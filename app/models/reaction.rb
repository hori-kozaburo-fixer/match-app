class Reaction < ApplicationRecord
  belongs_to :to_user, class_name: 'User'
  belongs_to :from_user, class_name: 'User'

  enum status: { like: 0, dislike: 1 }

  def create_notification_follow!(current_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? and action = ? ', current_user.id, to_user_id, 'follow'])
    if temp.blank?
      notification = Notification.new(
        visitor_id: from_user_id,
        visited_id: to_user_id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
