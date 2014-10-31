class Ability
  include CanCan::Ability

  def initialize(user)

    if user.has_role? :admin
      #El admin somos nosotros
      #No capturamos solamente vemos resultados
      can :manage, :all
    elsif user.has_role? :state
      can :view_state
      #El usuario federal puede llenar exclusivamente los estados de la república
      #Tipo IMSS, SEDENA y así
    elsif user.has_role? :federal
      can :fill_federal
    elsif user.has_role? :cenaprece
      can :cenaprece_view 
    else
      can :fill_state
    end
  end
end
