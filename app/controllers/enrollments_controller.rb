class EnrollmentsController < ApplicationController

  # GET /enrollments/ (all enrollments)
  def index
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    count = params[:count].to_i > 0 ? params[:count].to_i : 10

    @enrollments = Enrollment.page(page).per(count)

    enrollments_data = @enrollments.map do |enrollment|
      {
        id: enrollment.id,
        student_id: enrollment.student_id,
        course_id: enrollment.course_id,
        price: enrollment.price,
        status: enrollment.status
      }
    end

    render json: {
      page: page,
      items: enrollments_data
    }, status: :ok
  end
end
