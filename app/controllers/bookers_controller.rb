class BookersController < ApplicationController
  def index
  	@bookers = Booker.all
  	@booker = Booker.new
  end

  def show
  	@booker = Booker.find(params[:id])
  end

  def new
  	@booker = Booker.new
  end

  def create
  	booker = Booker.new(booker_params)
  	if booker.save
      flash[:success] = '投稿完了しました'
  	  redirect_to booker_path(booker.id)
    else
      render :new
    end
  end

  def edit
  	@booker = Booker.find(params[:id])
  end

  def update
  	booker = Booker.find(params[:id])
  	if booker.update(booker_params)
      flash[:success] = '編集完了しました'
  	  redirect_to booker_path
    else
      render :new
    end
  end

  def destroy
  	booker = Booker.find(params[:id])
  	booker.destroy
  	redirect_to bookers_path
  end

  private
  	def booker_params
  		params.require(:booker).permit(:title, :body)
  	end

end
