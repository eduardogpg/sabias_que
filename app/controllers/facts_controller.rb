class FactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fact, only: [:show, :edit, :update, :destroy]
  before_action :max_editor!

  def index
    @facts = Fact.paginate(page: params[:page], per_page:50)
  end

  def show
  end

  def new
    @fact = Fact.new
  end

  def edit
  end

  def create
    @fact = Fact.new(fact_params)
    @fact.user = current_user

    respond_to do |format|
      @fact.save
      format.js
    end
  end

  def update
    respond_to do |format|
      @fact.update(fact_params)
      format.js
    end
  end

  def destroy
    @fact.destroy
    respond_to do |format|
      format.html { redirect_to facts_url, notice: 'Fact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_fact
      @fact = Fact.find(params[:id])
    end

    def fact_params
      params.require(:fact).permit(:title, :description, :real, :provable, :color)
    end
end
