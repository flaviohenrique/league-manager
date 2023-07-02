class SeasonDriver < ApplicationRecord
  belongs_to :team
  belongs_to :driver
  belongs_to :season

  delegate :name, to: :driver

end
