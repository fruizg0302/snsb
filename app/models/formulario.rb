class Formulario < ActiveRecord::Base

  resourcify
  belongs_to :user
  belongs_to :efederativa

  attr_accessible :responsable_llenado, :fecha,:ape01, :ape02, :ape03, :ape04, :ape05, :ape06, :ape07, :api01, :api02, :api03, :api04, :ben01, :ben02, :cao01, :cao02, :cao03, :cao04, :cao05, :cao06, :cao07, :cao08, :cao09, :cao10, :cao11, :cao12, :cod01, :cod02, :per01, :per02, :ssb01, :tit01, :uni01, :uni02, :uni03, :user_id, :efederativa_id, :jurisdiction_id


  validates :responsable_llenado, :presence => { :message => "No puede ir en blanco" }
  validates :ape01, :ape02, :ape03, :ape04, :ape05, :ape06, :ape07, :api01, :api02, :api03, :api04, :ben01, :ben02, :cao01, :cao02, :cao03, :cao04, :cao05, :cao06, :cao07, :cao08, :cao09, :cao10, :cao11, :cao12, :cod01, :cod02, :per01, :per02, :ssb01, :tit01, :uni01, :uni02, :uni03, numericality: {only_integer: true,  message: "Solo pueden ir numeros enteros", :greater_than_or_equal_to => 0}

  def self.formularios_federales (user_id)
    Formulario.where("user_id = ?", user_id)
  end

  def self.resultados_estatales (efederativa_id)
   forms = Formulario.where("efederativa_id = ?", efederativa_id)

   sumas = Array.new
   sumas.push(forms.sum(:cod01))
   sumas.push(forms.sum(:cod02))
   sumas.push(forms.sum(:ape01))
   sumas.push(forms.sum(:ape02))
   sumas.push(forms.sum(:ape03))
   sumas.push(forms.sum(:ape04))
   sumas.push(forms.sum(:ape05))
   sumas.push(forms.sum(:ape06))
   sumas.push(forms.sum(:ape07))
    sumas.push(forms.sum(:api01))
    sumas.push(forms.sum(:api02))
    sumas.push(forms.sum(:api03))
    sumas.push(forms.sum(:api04))
    sumas.push(forms.sum(:ssb01))
    sumas.push(forms.sum(:cao01))
    sumas.push(forms.sum(:cao02))
    sumas.push(forms.sum(:cao03))
    sumas.push(forms.sum(:cao04))
    sumas.push(forms.sum(:cao05))
    sumas.push(forms.sum(:cao06))
    sumas.push(forms.sum(:cao07))
    sumas.push(forms.sum(:cao08))
    sumas.push(forms.sum(:cao09))
    sumas.push(forms.sum(:cao10))
    sumas.push(forms.sum(:cao11))
    sumas.push(forms.sum(:cao12)) 
    sumas.push(forms.sum(:tit01))
    sumas.push(forms.sum(:uni01))
    sumas.push(forms.sum(:uni02))
    sumas.push(forms.sum(:uni03))
    sumas.push(forms.sum(:ben01))
    sumas.push(forms.sum(:ben02))
    sumas.push(forms.sum(:per01))
    sumas.push(forms.sum(:per02))   

  end

  def self.resultados_nacionales

  a = Hash.new(0)

  indices = Efederativa.select("id")
  id = indices.map{|d| d.id }.flatten

    id.each do |f|

     a[[f,:cod01]] = Formulario.where('efederativa_id = ?', f).sum('cod01')
     a[[f,:cod02]] = Formulario.where('efederativa_id = ?', f).sum('cod02')
     a[[f,:ape01]] = Formulario.where('efederativa_id = ?', f).sum('ape01')
     a[[f,:ape02]] = Formulario.where('efederativa_id = ?', f).sum('ape02')
     a[[f,:ape03]] = Formulario.where('efederativa_id = ?', f).sum('ape03')
     a[[f,:ape04]] = Formulario.where('efederativa_id = ?', f).sum('ape04')
     a[[f,:ape05]] = Formulario.where('efederativa_id = ?', f).sum('ape05')
     a[[f,:ape06]] = Formulario.where('efederativa_id = ?', f).sum('ape06')
     a[[f,:ape07]] = Formulario.where('efederativa_id = ?', f).sum('ape07')
     a[[f,:api01]] = Formulario.where('efederativa_id = ?', f).sum('api01')
     a[[f,:api02]] = Formulario.where('efederativa_id = ?', f).sum('api02')
     a[[f,:api03]] = Formulario.where('efederativa_id = ?', f).sum('api03')
     a[[f,:ssb01]] = Formulario.where('efederativa_id = ?', f).sum('ssb01')
     a[[f,:ssb01]] = Formulario.where('efederativa_id = ?', f).sum('ssb01')
     a[[f,:cao01]] = Formulario.where('efederativa_id = ?', f).sum('cao01')
     a[[f,:cao02]] = Formulario.where('efederativa_id = ?', f).sum('cao02')
     a[[f,:cao03]] = Formulario.where('efederativa_id = ?', f).sum('cao03')
     a[[f,:cao04]] = Formulario.where('efederativa_id = ?', f).sum('cao04')
     a[[f,:cao05]] = Formulario.where('efederativa_id = ?', f).sum('cao05')
     a[[f,:cao06]] = Formulario.where('efederativa_id = ?', f).sum('cao06')
     a[[f,:cao07]] = Formulario.where('efederativa_id = ?', f).sum('cao07')
     a[[f,:cao08]] = Formulario.where('efederativa_id = ?', f).sum('cao08')
     a[[f,:cao10]] = Formulario.where('efederativa_id = ?', f).sum('cao10')
     a[[f,:cao11]] = Formulario.where('efederativa_id = ?', f).sum('cao11')
     a[[f,:cao12]] = Formulario.where('efederativa_id = ?', f).sum('cao12')
     a[[f,:tit01]] = Formulario.where('efederativa_id = ?', f).sum('tit01')
     a[[f,:uni01]] = Formulario.where('efederativa_id = ?', f).sum('uni01')
     a[[f,:uni02]] = Formulario.where('efederativa_id = ?', f).sum('uni02')
     a[[f,:uni03]] = Formulario.where('efederativa_id = ?', f).sum('uni03')
     a[[f,:ben01]] = Formulario.where('efederativa_id = ?', f).sum('ben01')
     a[[f,:ben02]] = Formulario.where('efederativa_id = ?', f).sum('ben02')
     a[[f,:per01]] = Formulario.where('efederativa_id = ?', f).sum('per02')

    end
   return a

  end

  def self.formularios_jurisdiccionales  (efederativa_id, juris_id)
    Formulario.where("efederativa_id = ? and jurisdiction_id = ?", efederativa_id, juris_id)
  end

end



