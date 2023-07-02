ActiveAdmin.register SeasonRace do
  permit_params do
    permitted = [:name, :circuit_id, :race_type, :order]
    permitted << [:season_id, :circuit_id] if params[:action] == 'create'
    permitted
  end

end
