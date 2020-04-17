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
      flash[:notice] =  "Create lesson successfully"
      redirect_to lessons_path
    else
      flash[:alert] = "Create lesson fail"
      render :new
    end
  end

  def edit
    @lesson = Lesson.find_by(id: params[:id])
  end

  def update
    @lesson = Lesson.find_by(id: params[:id])

    if @lesson.update(lesson_params)
      flash[:notice] = "Edit lesson successfully"
      redirect_to lessons_path
    else
      flash[:alert] = "Edit lesson fail"
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find_by(id: params[:id])
    @lesson.destroy if @lesson
    redirect_to lessons_path, notice: "Lesson delete !"
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :price , :concurrcy, :category, :status, :url, :description, :expired_days)
  end

end
