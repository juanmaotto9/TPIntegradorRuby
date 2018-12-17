class CompoundDocumentSerializer < ActiveModel::Serializer
  	attributes :id, :title, :description, :status, :user_id, :answer_id, :created_at, :updated_at
	has_many :answers
end
