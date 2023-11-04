# == Schema Information
#
# Table name: projects
#
#  id                    :bigint           not null, primary key
#  amount                :string
#  description           :string           not null
#  duration              :string
#  is_payed              :boolean
#  postulations_due_date :datetime
#  project_type          :integer          default("titulo"), not null
#  start_date            :date             default(Fri, 03 Nov 2023), not null
#  status                :integer          default("open")
#  title                 :string           not null
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

#  start_date            :date             default(Tue, 31 Oct 2023), not null


#  status                :integer          default("open")
#  title                 :string           not null

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
    validates :status, inclusion: { in: %w(open closed) }
    include PgSearch::Model
    
    pg_search_scope :search_by_title_description_and_teacher, against: [:title, :description], associated_against: {
      user: [:name, :last_name]
    }

    belongs_to :user

    has_many :inscriptions, dependent: :delete_all
    has_many :users, through: :inscriptions
    has_many :notifications


    enum project_type: {
    magister: 0,
    titulo: 1,

    }
    enum status: {
      closed: 0,
      open: 1,
    }


  def teacherName
    User.find(self.user_id).name + " " + User.find(self.user_id).last_name
    
  end

end
