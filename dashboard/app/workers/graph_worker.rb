require 'json'
require 'net/http'

class GraphWorker
    include Sidekiq::Worker
    @@api = "http://localhost:4567/coordinates"
    def perform(graph_id)
      graph = Graph.find(graph_id)
      study = graph.study
      begin
        json_graph = graph.to_json
        uri = URI(@@api)
        res = Net::HTTP.post_form(uri, {'graph' => json_graph})
        graph.coords = res.body #store the coords as JSON dont parse until display
        graph.save
  
      rescue StandardError => error
        graph.coords = JSON.generate [{x: 1, y: 2}, {x: 2, y:5}, {x:3, y:6}]
        graph.save!
        # Use the study object to associate the error message with the study.
        study.errors.add(:base, "Error: #{error}. Failed to retrieve coordinates. Please edit and try again.")
      end
    end
  end
  