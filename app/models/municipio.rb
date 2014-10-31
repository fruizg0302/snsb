class Municipio < ActiveRecord::Base

  belongs_to :efederativa
  has_many :formularios
  attr_accessible :id_efederativa, :id_municipio_ant, :municipio
end
