# == Schema Information
#
# Table name: inscriptions
#
#  id         :bigint           not null, primary key
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_inscriptions_on_project_id  (project_id)
#  index_inscriptions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
class Inscription < ApplicationRecord
    enum status: {
        "pending": 0,
        "approved": 1,
        "rejected": 2
    }
    belongs_to :user
    belongs_to :project
end
