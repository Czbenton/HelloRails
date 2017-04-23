class StudentsController < ApplicationController
  before_action :set_students
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET schools/1/students
  def index
    @students = @school.students
  end

  # GET schools/1/students/1
  def show
  end

  # GET schools/1/students/new
  def new
    @student = @school.students.build
  end

  # GET schools/1/students/1/edit
  def edit
  end

  # POST schools/1/students
  def create
    @student = @school.students.build(student_params)

    if @student.save
      redirect_to([@student.school, @student], notice: 'Student was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT schools/1/students/1
  def update
    if @student.update_attributes(student_params)
      redirect_to([@student.school, @student], notice: 'Student was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE schools/1/students/1
  def destroy
    @student.destroy

    redirect_to school_students_url(@school)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_students
      @school = School.find(params[:school_id])
    end

    def set_student
      @student = @school.students.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:name, :age, :graduated)
    end
end
