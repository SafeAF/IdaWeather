require 'json'
require 'net/http'

class GraphsController < ApplicationController
  before_action :set_graph, only: %i[ show edit update destroy ]
  before_action :set_study
  before_action :check_owner, only: [:edit, :update, :destroy]


  
  @@api = "http://localhost:4567/coordinates"


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
    @graph = Graph.find(params[:id])
  end



  # begin
  #   graph.coords = get_coordinates_from_api
  #   graph.save!
  # rescue StandardError => e
  #   puts "Error occurred: #{e}"
  #   graph.coords = [{x: 1, y: 2}, {x: 2, y: 5}, {x: 3, y: 6}]
  #   graph.save!
  # end
  
  # def create
  #   @graph = @study.graphs.new(graph_params)
  #   @graph.coords =  JSON.generate [{x: 1, y: 2}, {x: 2, y:5}, {x:3, y:6}]
  #   if @graph.save
  #     # Enqueue the GraphWorker job
  #     GraphWorker.perform_async(@graph.id)
  #     redirect_to study_path(@study), notice: 'Graph was successfully created. Processing coordinates in the background.'
  #   else
  #     format.html { render :new, status: :unprocessable_entity }
  #     format.json { render json: @graph.errors, status: :unprocessable_entity }
  #   end
  # end
  
  
  def create
    @graph = @study.graphs.new(graph_params)
    @graph.save
    begin
    json_graph = @graph.to_json
    uri = URI(@@api)
    res = Net::HTTP.post_form(uri, {'graph' => json_graph})
    @graph.coords = res.body #store the coords as JSON dont parse until display
    @graph.save

    rescue StandardError => error
      @graph.coords = [{x: 1, y: 2}, {x: 2, y:5}, {x:3, y:6}]
      @graph.save!
      flash[:error] = "Error: #{error}. Failed to retrieve coordinates. Please edit and try again."
    end


    if @graph.save
      redirect_to study_path(@study), notice: 'Graph was successfully created.'
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @graph.errors, status: :unprocessable_entity }
    end
  end





  # PATCH/PUT /graphs/1 or /graphs/1.json
  def update
    respond_to do |format|
      if @graph.update(graph_params)
        json_graph = @graph.to_json
        uri = URI(@@api)
        res = Net::HTTP.post_form(uri, {'graph' => json_graph})
        @graph.coords = res.body #store the coords as JSON dont parse until display
        @graph.save

        format.html { redirect_to study_url(@study), notice: "Graph was successfully updated." }
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
    def check_owner
      @graph = Graph.find(params[:id])
      unless current_user == @graph.study.user
        redirect_to studies_path, alert: "You are not authorized to perform this action."
      end
    end
  
  # Use callbacks to share common setup or constraints between actions.
    def set_graph
      @graph = Graph.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def graph_params
      params.require(:graph).permit(:name, :description, :start_year, :end_year, :year, :range, :month, :day, :hour, :independent_var, :dependent_var, :chart_type, :category, :location, :lat, :lon, :function, :study_id)
    end
  
    def set_study
      @study = Study.find(params[:study_id])
    end
end
