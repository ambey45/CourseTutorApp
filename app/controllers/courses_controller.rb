class CoursesController < ApplicationController

  def create
    course = Course.new(course_params)

    if course.save
      render json: course, status: 200
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  def index
    courses = Course.all
    render json: courses
  end

  private

  def course_params
    params.require(:course).permit(:id, :name, tutors_attributes: [:id, :name, :_destroy])
  end
end

