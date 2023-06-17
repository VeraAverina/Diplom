class ParagraphtestController < ApplicationController
    def create
        paragraphtest = Paragraphtest.create!(paragraphtest_params)
        redirect_to root_path
    end

    #def update
    #    paragraphtest = paragraphtest = Paragraphtest.find params[:id]
    #    redirect_to root_path
    #end

    #def index#    @paragraphtests=Paragraphtest.all
    #end

private
    def paragraphtest_params
        params.require(:paragraphtest.permit(:ordernum, :body, :itemtest_id, :posimage_id, :paragraphtype_id, :image))
    end

end
