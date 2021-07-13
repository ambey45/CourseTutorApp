require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe 'Courses#create' do
    context 'create course with tutors' do
     before do
      post :create, params: {
          course: {
            name: "Master of Computer Science",
            tutors_attributes: [
              {
                name: "Ajay Modi"
              },
              {
                name: "Reena Patidar"
              }
            ],
          },
        }
     end

     it { expect(response).to have_http_status(:ok) }
    end

    context 'check for blank name for course' do
      before do
        post :create, params: {
          course: {
            name: "",
            tutors_attributes: [
              {
                name: "Ajay Modi"
              },
              {
                name: "Reena Patidar"
              }
            ],
          },
        }
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe 'Courses#index' do
    context 'fetch course with tutors' do
      before do
       get :index
      end

     it { expect(response).to have_http_status(:ok) }
    end
  end
end