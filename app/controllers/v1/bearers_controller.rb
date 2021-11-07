module V1
  class BearersController < APIController
    def index
      @bearers = Bearer.all
    end

    def create
      build_bearer

      if @bearer.save
        @bearer
      else
        render_errors(@bearer.errors, :unprocessable_entity)
      end
    end

    private

    def build_bearer
      @bearer ||= Bearer.new(bearer_params)
    end

    def bearer_params
      params.require(:bearer).permit(:name)
    end
  end
end
