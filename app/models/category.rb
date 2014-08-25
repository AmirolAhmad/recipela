class Category < ActiveRecord::Base
	has_many :recipes
	validates :name, presence: true, uniqueness: true, length: {maximum: 50}
	acts_as_url :name, url_attribute: :slug

	default_scope -> { order('id DESC')}

	def as_json(options = {})
    options = {} if options.blank?

    default_options = {
                        :only => [:id, :name]
                      }
    super default_options.merge(options)
  end
end
