class StudentsController < ApplicationController

  # GET /students/ (all students)
  def index
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    count = params[:count].to_i > 0 ? params[:count].to_i : 10

    @students = Student.page(page).per(count)

    students_data = @students.map do |student|
      {
        id: student.id,
        name: student.name,
        cpf: student.cpf,
        birthdate: student.birthdate.strftime('%d/%m/%Y'),
        payment_method: student.payment_method
      }
    end

    render json: {
      page: page,
      items: students_data
    }, status: :ok
  end

  # POST /students/ (create student)
  def create
    @student = Student.new(student_params)

    if @student.save
      render json: { id: @student.id }, status: :created
    else
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :cpf, :birthdate, :payment_method)
  end
end
