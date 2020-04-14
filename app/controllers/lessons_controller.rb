class LessonsController < ApplicationController

  skip_before_action :authorize, only: :index

  def index
    @lessons = Lesson.all
    if session[:manager_name]
      flash[:notice] = "Welcome, #{session[:manager_name]}"
    else
      flash[:notice] = "Please log in"
    end

  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to lessons_path, notice: "Create lesson successfully"
    else
      render :new, alert: "Create lesson fail"
    end
  end

  def edit
    @lesson = Lesson.find_by(id: params[:id])
  end

  def update
    @lesson = Lesson.find_by(id: params[:id])

    if @lesson.update(lesson_params)
      redirect_to lessons_path, notice: "Edit lesson successfully"
    else
      render :edit, alert: "Edit lesson fail"
    end
  end

  def destroy
    @lesson = Lesson.find_by(id: params[:id])
    @lesson.destroy if @lesson
    redirect_to lessons_path, notice: "Lesson delete !"
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :price , :concurrcy, :category, :status, :url, :description, :expired_time)
  end

end
