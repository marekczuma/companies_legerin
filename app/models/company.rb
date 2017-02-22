class Company < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name 'companies'

  def as_indexed_json(options={})
    self.as_json({
      only: [:name, :description, :id, :income, :employee_amount, :address],
    })
  end

  def self.search_by_query_string(query)
    __elasticsearch__.search(
      {
        query: {
          query_string: {
            query: query
          }
        }
      }
    )
  end

  def self.search_little_more_advanced(query)
    __elasticsearch__.search(
      {
        query: {
          query_string: {
            query: query,
            fields: ['description^5', 'address']
          }
        }
      }
    )
  end

  def self.search_by_part_of_phrase(query)
    __elasticsearch__.search(
      {
        query: {
          query_string: {
            query: "*#{query}*",
            fields: ['name', 'description^5', 'address']
          }
        }
      }
    )
  end

  def self.search_with_misspelling(query)
    __elasticsearch__.search(
      {
        query: {
          query_string: {
            query: "#{query}~",
            fields: ['name', 'description', 'address']
          }
        }
      }
    )
  end
end
