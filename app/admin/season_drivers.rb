ActiveAdmin.register SeasonDriver do
  permit_params do
    permitted = [:team_id, :driver_id]
    permitted << :season_id if params[:action] == 'create'
    permitted
  end
end
