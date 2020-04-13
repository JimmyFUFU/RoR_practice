class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end


  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to lessons_path, notice: "新增課程成功"
    else
      render :new, notice: "新增課程失敗"
    end
  end

  def edit
    @lesson = Lesson.find_by(id: params[:id])
  end

  def update
    @lesson = Lesson.find_by(id: params[:id])

    if @lesson.update(lesson_params)
      redirect_to lessons_path, notice: "新增課程成功"
    else
      render :edit, notice: "新增課程失敗"
    end
  end

  def destroy
    @lesson = Lesson.find_by(id: params[:id])
    @lesson.destroy if @lesson
    redirect_to lessons_path, notice: "課程已刪除!"
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :price , :concurrcy, :category, :status, :url, :description, :expired_time)
  end

end
