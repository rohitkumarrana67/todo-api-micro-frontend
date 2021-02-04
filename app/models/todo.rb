class Todo < ApplicationRecord
    validates :title , presence: true
    validates :description , presence: true
    scope :do, -> {where( type: 'Do' )}
    scope :progress, -> {where( type: 'Progress' )}
    scope :done, -> {where( type: 'Done' )}
end
