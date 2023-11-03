# == Schema Information
#
# Table name: notifications
#
#  id             :bigint           not null, primary key
#  description    :string           default(""), not null
#  title          :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  inscription_id :bigint
#  project_id     :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_notifications_on_inscription_id  (inscription_id)
#  index_notifications_on_project_id      (project_id)
#  index_notifications_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (inscription_id => inscriptions.id)
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
class Notification < ApplicationRecord
    belongs_to :user
    belongs_to :project
end
