ActiveAdmin.register SeasonRaceResult do
  permit_params do
    permitted = [:season_result_id, :season_driver_id, :fastest_lap, :point, :position]
    permitted << :season_race_id if params[:action] == 'create'
    permitted
  end
end
