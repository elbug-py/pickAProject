# == Schema Information
#
# Table name: types
#
#  id         :bigint           not null, primary key
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Type < ApplicationRecord
    enum type: {
        "Investigación (Magíster)": 0,
        "Proyecto de Título": 1,
    }
end
