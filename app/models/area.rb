# == Schema Information
#
# Table name: areas
#
#  id         :bigint           not null, primary key
#  name       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Area < ApplicationRecord
    enum name: {
        "Obras Civiles": 0,
        "Eléctrica": 1,
        "Ciencias de la Computación": 2,
        "Industrial": 3,
        "Ambiental": 4
    }
end
