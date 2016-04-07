class ProductsController < ApplicationController
  include ProductsHelper
  include SearchProductsHelper
  before_action :set_product, only: [:show, :update]
  

  # GET /products
  # GET /products.json
  def index
    @products = []
    if params[:keywords].present?
      @products = search(params[:keywords])
    else
      @products = Product.all
    end
    respond_to do |format|
        format.js
        format.html
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit   
    @product = Product.find(params[:product_id])
    if @product.user_id != current_user.id
      redirect_to current_user, notice: "You don't have access to modify this product!!!"
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:product_id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :user_id, :currency)
    end

    def search keyword
      @query_creator = QueryCreator.new keyword
      products = Product.where(@query_creator.query_str, @query_creator.query_arg)
      products
    end
end
