class Jurisdiction < ActiveRecord::Base

  belongs_to :efederativa

  attr_accessible :efederativa_id, :jurisdiction, :jurisdiction_anterior_id, :municipio_id
end
