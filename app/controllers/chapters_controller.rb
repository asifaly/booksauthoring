class ChaptersController < ApplicationController
  def new
    @chapter = Chapter.new
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter, notice: 'chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def chapter_params
    params.require(:chapter).permit(:title, :chapter_no, :book_id)
  end
end
