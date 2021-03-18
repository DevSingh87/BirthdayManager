namespace :user do
  desc "a new task to be executed"
  task birthday_reminder: :environment do
    puts "hello rake"
    # All Users
    users = User.all
    next_birthday_month = (Date.today + 2.days).strftime("%m")
    next_birthday_day = (Date.today + 2.days).strftime("%d")
    users.each do |user|
      friends = Friend.where("user_id = ? and date_part('month', dob) = ? and date_part('day', dob) = ?" , user.id, next_birthday_month, next_birthday_day)
      if friends
        UserMailer.send_birthday_reminder(user, friends).deliver!
      end
    end
  end
end
