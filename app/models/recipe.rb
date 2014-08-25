class Recipe < ActiveRecord::Base
	acts_as_paranoid #https://github.com/radar/paranoia
	
	extend FriendlyId
	
	friendly_id :title, use: [:slugged, :finders, :history]

	belongs_to :user
	belongs_to :category
	belongs_to :difficulty

	validates_presence_of :user_id

	self.per_page = 10

	default_scope -> { order('`recipes`.created_at DESC') }
	scope :published, -> { where('status = ?', 'published').unscope(:order).order('`recipes`.published_at DESC') }
	scope :featured, -> { where(featured: true) }
	scope :published_only, -> { published.where('featured IS NOT TRUE') }
	scope :by_category, -> (category_id) { where(category_id: category_id) }

	scope :random_recipe, -> { order('RAND()').limit(4) }

	after_save :publish_callback

	protected
	def should_generate_new_friendly_id?
		title_changed?
	end

  def publish_callback
    self.touch(:published_at) if status_changed? && status == 'published'
  end
end
