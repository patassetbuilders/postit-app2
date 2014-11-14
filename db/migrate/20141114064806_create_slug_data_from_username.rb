class CreateSlugDataFromUsername < ActiveRecord::Migration
  #slug is generated before save
  def change
    user = User.all
    user.each do |user|
      user.save
    end
  end
end
