class Question < ApplicationRecord
  	belongs_to :user
  	has_many :answers

  	validates_presence_of :title, :description
    scope :latest, ->{ select(:id, :title, :description, :status).order(updated_at: :desc) }
    scope :pending_first, -> { select(:id, :title, :description, :status).order(status: :asc , updated_at: :desc) }
    scope :needing_help, -> { select(:id, :title, :description, :status).where(status: false).left_joins(:answers).group(:id).order('COUNT(answers.id) ASC')}
end

