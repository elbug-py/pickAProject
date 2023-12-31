# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_name              :string           default(""), not null
#  name                   :string           default(""), not null
#  profile_icon           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("student"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  area_id                :bigint           not null
#
# Indexes
#
#  index_users_on_area_id               (area_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (area_id => areas.id)
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: {
    admin: 0,
    student: 1,
    teacher: 2
  }

  has_many :projects
  has_many :inscriptions
  belongs_to :area
  has_many :notifications

  has_one_attached :profile_icon

  validates_length_of :password, minimum: 8, allow_blank: true
  def self.ransackable_attributes(auth_object = nil)
    ["name","last_name"]

  end

end
