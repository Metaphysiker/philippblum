class PdfsController < ApplicationController
  before_action :authenticate_user!, except: :getpdf
  before_action :user_allowed?, except: :getpdf
  #Index action, photos gets listed in the order at which they were created
  def index

  end

  #New action for creating a new photo
  def new
    @pdf = Pdf.new
  end

  def edit
    @pdf = Pdf.find(params[:id])
  end

  def update
    @pdf = Pdf.find(params[:id])

      if @pdf.update(pdf_params)
        flash[:notice] = "Successfully updated pdf!"
        redirect_to pdfs_path
      else
        render :edit
      end
  end
  #Create action ensures that submitted photo gets created if it meets the requirements
  def create
    @pdf = Pdf.new(pdf_params)

    if @pdf.save
      flash[:notice] = "Successfully added new pdf!"
      redirect_to pdfs_path
    else
      flash[:alert] = "Error adding new pdf!"
      render :new
    end
  end

  def destroy
    @pdf= Pdf.find(params[:id])
    if @pdf.destroy
      flash[:notice] = "Successfully deleted pdf!"
      redirect_to pdfs_path
    else
      flash[:alert] = "Error deleting photo!"
    end
  end

  def getpdf
    url = params[:url]

    ahoy.track url, {language: "Ruby"}

    unless url.nil?
      pdf = Pdf.find_by_url(url)
      redirect_to pdf.file.url(:original, false)
    end

  end

  def index2

    search = params[:search]

    if search.nil? || search.empty?
      @pdfs = Pdf.all
    else
      @pdfs = Pdf.where("title ILIKE ? OR url ILIKE ? OR file_file_name ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
      #@pdfs = Pdf.search_title_file_name_url(search)
    end

  end

  def renderpdfresults
    search = params[:search]

    allowed_partials = ["pdfresults", "pdfresultsoutside"]

    partial = allowed_partials[allowed_partials.index(params[:partial].to_s)]
    if allowed_partials.include?(params[:partial].to_s)
      partial = params[:partial].to_s
    else
      partial = allowed_partials[1]
    end

    if search.nil? || search.empty?
      @pdfs = Pdf.all
    else
      @pdfs = Pdf.where("title ILIKE ? OR url ILIKE ? OR file_file_name ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
      #@pdfs = Pdf.search_title_file_name_url(search)
    end

    respond_to do |format|
      format.html { render partial: partial }
    end

  end

  private

  #Permitted parameters when creating a photo. This is used for security reasons.
  def pdf_params
    params.require(:pdf).permit(:title, :file)
  end

end
