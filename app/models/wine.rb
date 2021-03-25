class Wine < ApplicationRecord
  #Permite borrar en cascada :destroy
  has_many :wine_strains, dependent: :destroy
  has_many :strains, through: :wine_strains
  # Para anidar un formulario dentro de wine con la tabla wine_strains debemos:
  #no permitir porcentajes en blaco y borrar
  accepts_nested_attributes_for(:wine_strains, reject_if: lambda{|a| a[:percentage].blank?}, allow_destroy: true)
  #debemos agregar wine_strains_attributes en el wines.controller

end
