class Course < ApplicationRecord
  has_many :tutors
  validates :name, presence: true
  accepts_nested_attributes_for :tutors, reject_if: proc { |attributes| attributes['name'].blank? } , allow_destroy: true

  def as_json(options={})
    super(:except => [:created_at,:updated_at],
          :include => { 
            tutors: {
               :only => [:id, :name]
          }
        }
      )
  end
end
