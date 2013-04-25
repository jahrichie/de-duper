class Home < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << rows
      all.each do |intersect|
        csv << intersect.attributes.values_at(*rows)
      end
    end
  end
end
