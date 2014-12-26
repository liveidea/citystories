namespace :my_task do
  task :updates => :environment do
    User.all.each do |user|
      updated_stories =[]
      user.followed_stories.each do |fl_story|
        if fl_story.story_updates.where(created_at: (user.current_sign_in_at)..Time.zone.now).any?
          updated_stories << fl_story.id
        end
      end

      if (user.current_sign_in_at < Time.zone.now && updated_stories.any?)
        UpdateMailer.update_email(user,updated_stories).deliver
      end

    end
  end
end
