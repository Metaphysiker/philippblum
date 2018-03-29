class PdfsController < ApplicationController

  #Index action, photos gets listed in the order at which they were created
  def index
    @pdfs = Pdf.all
  end

  #New action for creating a new photo
  def new
    @pdf = Pdf.new
  end

  #Create action ensures that submitted photo gets created if it meets the requirements
  def create
    @pdf = Pdf.new(pdf_params)

    if @pdf.save
      flash[:notice] = "Successfully added new pdf!"
      redirect_to root_path
    else
      flash[:alert] = "Error adding new pdf!"
      render :new
    end
  end

  def destroy
    @pdf= Pdf.find(params[:id])
    if @pdf.destroy
      flash[:notice] = "Successfully deleted photo!"
      redirect_to root_path
    else
      flash[:alert] = "Error deleting photo!"
    end
  end

  def getpdf
    url = params[:url]

    unless url.nil?
      pdf = Pdf.find_by_url(url)
      redirect_to pdf.file.url(:original, false)
    end

  end

  private

  #Permitted parameters when creating a photo. This is used for security reasons.
  def pdf_params
    params.require(:pdf).permit(:title, :file)
  end

end
