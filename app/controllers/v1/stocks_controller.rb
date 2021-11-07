module V1
  class StocksController < APIController
    def index
      @stocks = Stock.active
    end

    def create
      build_stock

      if @stock.save
        @stock
      else
        render_errors(@stock.errors, :unprocessable_entity)
      end
    end

    def update
      if stock.update(stock_params)
        @stock
      else
        render_errors(@stock.errors, :unprocessable_entity)
      end
    end

    private

    def stock
      @stock ||= Stock.find(params[:id])
    end

    def build_stock
      @stock ||= Stock.new(stock_params)
    end

    def stock_params
      params.require(:stock).permit(:name, :bearer_id, :archive)
    end
  end
end
