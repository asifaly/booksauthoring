class SectionsController < ApplicationController
  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    respond_to do |format|
      format.html { redirect_to book_url, notice: 'section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    @section = Section.find(params[:id])
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: 'section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @section = Section.find(params[:id])
  end

  def edit
    @section = Section.find(params[:id])
  end

  private
  def section_params
    params.require(:section).permit(:title, :section_no, :chapter_id)
  end
end
