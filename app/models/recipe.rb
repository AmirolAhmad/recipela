class Recipe < ActiveRecord::Base
	acts_as_paranoid #https://github.com/radar/paranoia
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders, :history]

	belongs_to :user

	paginates_per 10

	default_scope -> { order('`recipes`.created_at DESC') }

	protected
	def should_generate_new_friendly_id?
		title_changed?
	end
end
