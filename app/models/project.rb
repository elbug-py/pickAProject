# == Schema Information
#
# Table name: projects
#
#  id                    :bigint           not null, primary key
#  amount                :string
#  description           :string
#  duration              :string
#  is_payed              :boolean
#  postulations_due_date :datetime
#  project_type          :integer          default("titulo"), not null
#  title                 :string
#  vacancies             :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :bigint           not null
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Project < ApplicationRecord
    belongs_to :user

    has_many :inscriptions, dependent: :delete_all
    has_many :users, through: :inscriptions
    has_many :notifications


    enum project_type: {
    magister: 0,
    titulo: 1,
  }
end
