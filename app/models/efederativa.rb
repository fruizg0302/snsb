class Efederativa < ActiveRecord::Base

  has_many :users
  has_many :municipios
  has_many :formularios
  has_many :jurisdictions

  attr_accessible :entidadFederativa

end
