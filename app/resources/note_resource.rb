class NoteResource < ApplicationResource
  attribute :body, :string
  attribute :notable_id, :integer, only: [:filterable]

  filter :notable_type, :string, allow: %w[Employee Department Team]

  polymorphic_belongs_to :notable do
    group_by(:notable_type) do
      on(:Employee)
      on(:Team)
      on(:Department)
    end
  end
end
