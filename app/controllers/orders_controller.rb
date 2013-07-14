# encoding: utf-8
class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where('updated_at > ?', Time.now - 4.hours ).all
    # @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    authorize! :edit, @order
  end

  # POST /orders
  # POST /orders.json
  def create
    unless Setting.block_ordering
      @order = Order.new
      params[:dishes].each { |k, v|
        v = v.to_i
        next if v == 0
        @order.order_dishes.build({ dish_id: k, number: v})
      }
      @order.user = current_user

      respond_to do |format|
        if @order.save
          format.html { redirect_to orders_url, notice: '成功提交.' }
          format.json { render json: @order, status: :created, location: @order }
        else
          format.html { render action: "new" }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to orders_url, notice: '已超过点餐时间，点餐失败'
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    unless Setting.block_ordering
      old_order = Order.find(params[:id])
      old_order.destroy if old_order

      @order = Order.new
      params[:dishes].each { |k, v|
        v = v.to_i
        next if v == 0
        @order.order_dishes.build({ dish_id: k, number: v})
      }
      @order.user = current_user

      respond_to do |format|
        if @order.save
          format.html { redirect_to orders_url, notice: '成功更新.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to orders_url, notice: '已超过点餐时间，修改失败'
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    authorize! :destroy, @order
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
