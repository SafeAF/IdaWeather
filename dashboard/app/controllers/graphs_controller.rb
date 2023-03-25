class GraphsController < ApplicationController
  before_action :set_graph, only: %i[ show edit update destroy ]
  before_action :set_study
  # GET /graphs or /graphs.json
  def index
    @graphs = Graph.all
  end

  # GET /graphs/1 or /graphs/1.json
  def show
  end

  # GET /graphs/new
  def new
    @graph = Graph.new
  end

  # GET /graphs/1/edit
  def edit
  end

  # POST /graphs or /graphs.json
  # def create
  #   @graph = Graph.new(graph_params)
  #   @graph.study_id = 
  #   respond_to do |format|
  #     if @graph.save
  #       format.html { redirect_to graph_url(@graph), notice: "Graph was successfully created." }
  #       format.json { render :show, status: :created, location: @graph }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @graph.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  
  
    def create
      @graph = @study.graphs.new(graph_params)
      @graph.save


      # @study = current_user.studies.find(params[:study_id])
      # @graph = @study.graphs.build(graph_params)
  
      if @graph.save
        redirect_to study_path(@study), notice: 'Graph was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def graph_params
      params.require(:graph).permit(:title, :description, :image)
    end
  



  # PATCH/PUT /graphs/1 or /graphs/1.json
  def update
    respond_to do |format|
      if @graph.update(graph_params)
        format.html { redirect_to graph_url(@graph), notice: "Graph was successfully updated." }
        format.json { render :show, status: :ok, location: @graph }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graphs/1 or /graphs/1.json
  def destroy
    @graph.destroy

    respond_to do |format|
      format.html { redirect_to graphs_url, notice: "Graph was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graph
      @graph = Graph.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def graph_params
      params.require(:graph).permit(:name, :description, :start_year, :end_year, :year, :range, :month, :day, :hour, :independent_var, :dependent_var, :chart_type, :category, :location, :lat, :lon, :function, :study_id)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  
    def set_study
      @study = Study.find(params[:study_id])
    end
end
