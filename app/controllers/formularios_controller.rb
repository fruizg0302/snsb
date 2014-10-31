class FormulariosController < ApplicationController
  # GET /formularios
  # GET /formularios.json
  #load_and_authorize_resource
  before_filter :authenticate_user!


  def index

    #Los formularios federales son los que llenan las instituciones como el IMSS y el ISSSTE
    if   can? :fill_federal, @user
      @formularios = Formulario.formularios_federales(current_user.id).order.page(params[:page]).per(5)
      @formularios_excel = Formulario.formularios_federales(current_user.id)

    elsif can? :view_state, @user

      @formularios = Formulario.resultados_estatales(current_user.efederativa_id)
      @formularios_excel = Formulario.formularios_federales(current_user.id)

    elsif can? :cenaprece_view, @user

      @formularios = Formulario.resultados_nacionales
      @formularios_excel = Formulario.all

    else
      @formularios = Formulario.formularios_jurisdiccionales(current_user.efederativa_id, current_user.jurisdiction_id).order.page(params[:page]).per(5)
      @formularios_excel = Formulario.formularios_jurisdiccionales(current_user.efederativa_id, current_user.jurisdiction_id)

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @formularios }
      if can? :cenaprece_view, @user
        format.xls { send_data @formularios_excel.to_xls(:columns =>[:cod01, :cod02,:ape01, :ape02, :ape03, :ape04, :ape05, :ape06, :ape07,:api01, :api02, :api03, :api04,:ssb01,  :cao01, :cao02, :cao03, :cao04, :cao05, :cao06, :cao07, :cao08, :cao09, :cao10, :cao11, :cao12, :tit01,:uni01, :uni02, :uni03, :ben01, :ben02,:per01, :per02], :headers => ["COD1: Primera Vez", "COD2: Subsecuente", "APE01: Deteccion de placa bacteriana", "APE02: Instruccion en tecnica de cepillado", "APE03: Instruccion de uso del hilo dental", "APE04: Enjuague de fluoruro de sodio (Auto aplicaciones)", "APE05: Revision de tejidos bucales", "APE06: Revision e instruccion de higiene de protesis", "APE07: Instruccion de autoexamen de cavidad bucal", "API01: Profilaxis", "API02: Odontoxesis", "API03: Aplicacion topica de fluor", "API04: Sellado de fosetas y fisuras","SSB01: Sesiones sobre salud bucal", "CAO01: Obturacion con amalgama", "CAO02: Obturacion con resina", "CAO03: Obturacion con ionometro de vidrio", "CAO04: Tratamiento restaurativo atraumatico (extramuros)", "CAO05: Curacion con material temporal", "CAO06: Extracciones temporales", "CAO07: Extracciones permanentes", "CAO08: Terapia Pulpar", "CAO09: Cirugia Bucal", "CAO10: Farmacoterapia", "CAO11: Otras atenciones", "CAO12: Radiografias", "TIT01: Tratamiento Integral Terminado", "UNI01: Escuelas", "UNI02:  Unidades de Salud", "UNI03: Otros(ferias de salud, plazas, mercados, etc)", "BEN01: MENORES DE 20 anios", "BEN02: 20 anios o mas", "PER01: Personal de salud", "PER02: Otros" ],:header_format => {:weight => :bold, :color => :blue},:filename => 'capturas.xls')}
      else
        format.xls { send_data @formularios_excel.to_xls(:columns =>[ :responsable_llenado, :fecha, :cod01, :cod02,:ape01, :ape02, :ape03, :ape04, :ape05, :ape06, :ape07,:api01, :api02, :api03, :api04,:ssb01,  :cao01, :cao02, :cao03, :cao04, :cao05, :cao06, :cao07, :cao08, :cao09, :cao10, :cao11, :cao12, :tit01,:uni01, :uni02, :uni03, :ben01, :ben02,:per01, :per02], :headers => ["Reponsable de llenado", "Fecha de captura", "COD1: Primera Vez", "COD2: Subsecuente", "APE01: Deteccion de placa bacteriana", "APE02: Instruccion en tecnica de cepillado", "APE03: Instruccion de uso del hilo dental", "APE04: Enjuague de fluoruro de sodio (Auto aplicaciones)", "APE05: Revision de tejidos bucales", "APE06: Revision e instruccion de higiene de protesis", "APE07: Instruccion de autoexamen de cavidad bucal", "API01: Profilaxis", "API02: Odontoxesis", "API03: Aplicacion topica de fluor", "API04: Sellado de fosetas y fisuras","SSB01: Sesiones sobre salud bucal", "CAO01: Obturacion con amalgama", "CAO02: Obturacion con resina", "CAO03: Obturacion con ionometro de vidrio", "CAO04: Tratamiento restaurativo atraumatico (extramuros)", "CAO05: Curacion con material temporal", "CAO06: Extracciones temporales", "CAO07: Extracciones permanentes", "CAO08: Terapia Pulpar", "CAO09: Cirugia Bucal", "CAO10: Farmacoterapia", "CAO11: Otras atenciones", "CAO12: Radiografias", "TIT01: Tratamiento Integral Terminado", "UNI01: Escuelas", "UNI02:  Unidades de Salud", "UNI03: Otros(ferias de salud, plazas, mercados, etc)", "BEN01: MENORES DE 20 anios", "BEN02: 20 anios o mas", "PER01: Personal de salud", "PER02: Otros" ],:header_format => {:weight => :bold, :color => :blue},:filename => 'capturas.xls')}
      end

    end
  end

  # GET /formularios/1
  # GET /formularios/1.json
  def show
    @formulario = Formulario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @formulario }
    end
  end

  # GET /formularios/new
  # GET /formularios/new.json
  def new
    @formulario = Formulario.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @formulario }
    end
  end

  # GET /formularios/1/edit
  def edit
    @formulario = Formulario.find(params[:id])
  end

  # POST /formularios
  # POST /formularios.json
  def create
    @formulario = Formulario.new(params[:formulario])

    respond_to do |format|
      if @formulario.save
        format.html { redirect_to @formulario, notice: 'Registro exitoso.' }
        format.json { render json: @formulario, status: :created, location: @formulario }
      else
        format.html { render action: "new" }
        format.json { render json: @formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /formularios/1
  # PUT /formularios/1.json
  def update
    @formulario = Formulario.find(params[:id])

    respond_to do |format|
      if @formulario.update_attributes(params[:formulario])
        format.html { redirect_to @formulario, notice: 'Editado con exito.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formularios/1
  # DELETE /formularios/1.json
  def destroy
    @formulario = Formulario.find(params[:id])
    @formulario.destroy

    respond_to do |format|
      format.html { redirect_to formularios_url }
      format.json { head :no_content }
    end
  end

end
