class EnrollmentsController < ApplicationController
  # Base64 'Basic YWRtaW46YWRtaW4=\n' Authorization Header
  http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD'], only: [:create]

  # GET /enrollments/ (all enrollments)
  def index
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    count = params[:count].to_i > 0 ? params[:count].to_i : 10
    
    @enrollments = Enrollment.page(page).per(count)

    enrollments_data = @enrollments.map do |enrollment|
      {
        id: enrollment.id,
        student_id: enrollment.student_id,
        amount: enrollment.amount,
        installments: enrollment.installments,
        due_day: enrollment.due_day,
        bills: enrollment.bills.map do |bill|
          {
            id: bill.id,
            due_date: bill.due_date.strftime('%d/%m/%Y'),
            status: bill.status,
            amount: bill.amount
          }
        end
      }
    end

    render json: {
      page: page,
      items: enrollments_data
    }, status: :ok
  end

  # POST /enrollments/ (create enrollment)
  def create
    @enrollment = Enrollment.new(enrollment_params)

    if @enrollment.save

      Bill.create_bills(@enrollment)

      render json: {
        id: @enrollment.id,
        student_id: @enrollment.student_id,
        amount: @enrollment.amount,
        installments: @enrollment.installments,
        due_day: @enrollment.due_day,
        bills: @enrollment.bills.map do |bill|
          {
            id: bill.id,
            due_date: bill.due_date.strftime('%d/%m/%Y'),
            status: bill.status,
            amount: bill.amount
          }
        end
      }, status: :created
    else
      render json: { errors: @enrollment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def enrollment_params
    params.require(:enrollment).permit(:student_id, :amount, :installments, :due_day)
  end
end
