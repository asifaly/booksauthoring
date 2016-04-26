class ChaptersController < ApplicationController
  def new
    @chapter = Chapter.new
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:id])
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to @chapter, notice: 'chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    # @book = Book.find(params[:id])
    @chapter = Chapter.find(params[:id])
    @sections = @chapter.sections
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

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to book_url, notice: 'chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def chapter_params
    params.require(:chapter).permit(:title, :chapter_no, :book_id)
  end
end
