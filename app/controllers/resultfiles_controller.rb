class ResultfilesController < ApplicationController
  def index
    @resultfiles = Resultfile.all
  end

  def new
    @resultfile = Resultfile.new
  end

  def create
    @resultfile = Resultfile.new(resultfile_params)
    
    @resultfile.user_id=current_user.id
   #@resultfile.role_id=1
    
    #raise @resultfile.inspec
    if @resultfile.save
      redirect_to profile_path, notice: "The file has been uploaded."
    else
      render "new"
    end

  end

  def edit
    @resultfile = Resultfile.find(params[:id])
  end
  def destroy
    @resultfile = Resultfile.find(params[:id])
    @resultfile.destroy
    redirect_to resultfiles_path
  end

  def update
    @resultfile = Resultfile.find(params[:id])
    if @resultfile.update(resultfile_params)
      #raise @resultfile.inspect
      redirect_to @resultfile
    else
      render :edit
    end
  end

  def show
    @resultfile = Resultfile.find(params[:id])
  end

  private
  def resultfile_params
    params.require(:resultfile).permit(:name, :namefile, :role_id, :mark, :comment)
  end

  def result_params
   params.require(:result).permit(:mark,:comment)
  end
end