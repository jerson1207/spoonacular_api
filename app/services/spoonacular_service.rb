class SpoonacularService
  include HTTParty
  base_uri 'https://api.spoonacular.com'
    

  def self.search_recipes(query)
    api_key = Rails.application.credentials.spoonacular_api_key
    response = get("/recipes/search?query=#{query}&apiKey=#{api_key}")
    
    if response.success?
      recipes = JSON.parse(response.body)
      return recipes['results']
    else
      raise "Failed to fetch recipes: #{response.code} - #{response.message}"
    end
  end
end