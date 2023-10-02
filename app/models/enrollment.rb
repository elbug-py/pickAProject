# == Schema Information
#
# Table name: enrollments
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
#  index_enrollments_on_project_id  (project_id)
#  index_enrollments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
class Enrollment < ApplicationRecord
    enum status: {
        "pending": 0,
        "approved": 1,
        "rejected": 2
    }
end
