class Ship < ApplicationRecord
  before_save :downcase_fields

  def downcase_fields
    self.name.capitalize!
    self.s_class.downcase!
    self.notes.downcase!
  end
end
