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


  
  
  def create
    @graph = @study.graphs.new(graph_params)
    @graph.save
    json_graph = @graph.to_json
    uri = URI(@@api)
    res = Net::HTTP.post_form(uri, {'graph' => json_graph})
    @graph.coords = res.body #store the coords as JSON dont parse until display
    @graph.save

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
