require 'test_helper'

class FormulariosControllerTest < ActionController::TestCase
  setup do
    @formulario = formularios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formularios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulario" do
    assert_difference('Formulario.count') do
      post :create, formulario: { ape01: @formulario.ape01, ape02: @formulario.ape02, ape03: @formulario.ape03, ape04: @formulario.ape04, ape05: @formulario.ape05, ape06: @formulario.ape06, ape07: @formulario.ape07, api01: @formulario.api01, api02: @formulario.api02, api03: @formulario.api03, api04: @formulario.api04, ben01: @formulario.ben01, ben02: @formulario.ben02, cao01: @formulario.cao01, cao02: @formulario.cao02, cao03: @formulario.cao03, cao04: @formulario.cao04, cao05: @formulario.cao05, cao06: @formulario.cao06, cao07: @formulario.cao07, cao08: @formulario.cao08, cao09: @formulario.cao09, cao10: @formulario.cao10, cao11: @formulario.cao11, cao12: @formulario.cao12, cod01: @formulario.cod01, cod02: @formulario.cod02, per01: @formulario.per01, per02: @formulario.per02, ssb01: @formulario.ssb01, tit01: @formulario.tit01, uni01: @formulario.uni01, uni02: @formulario.uni02, uni03: @formulario.uni03 }
    end

    assert_redirected_to formulario_path(assigns(:formulario))
  end

  test "should show formulario" do
    get :show, id: @formulario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulario
    assert_response :success
  end

  test "should update formulario" do
    put :update, id: @formulario, formulario: { ape01: @formulario.ape01, ape02: @formulario.ape02, ape03: @formulario.ape03, ape04: @formulario.ape04, ape05: @formulario.ape05, ape06: @formulario.ape06, ape07: @formulario.ape07, api01: @formulario.api01, api02: @formulario.api02, api03: @formulario.api03, api04: @formulario.api04, ben01: @formulario.ben01, ben02: @formulario.ben02, cao01: @formulario.cao01, cao02: @formulario.cao02, cao03: @formulario.cao03, cao04: @formulario.cao04, cao05: @formulario.cao05, cao06: @formulario.cao06, cao07: @formulario.cao07, cao08: @formulario.cao08, cao09: @formulario.cao09, cao10: @formulario.cao10, cao11: @formulario.cao11, cao12: @formulario.cao12, cod01: @formulario.cod01, cod02: @formulario.cod02, per01: @formulario.per01, per02: @formulario.per02, ssb01: @formulario.ssb01, tit01: @formulario.tit01, uni01: @formulario.uni01, uni02: @formulario.uni02, uni03: @formulario.uni03 }
    assert_redirected_to formulario_path(assigns(:formulario))
  end

  test "should destroy formulario" do
    assert_difference('Formulario.count', -1) do
      delete :destroy, id: @formulario
    end

    assert_redirected_to formularios_path
  end
end
