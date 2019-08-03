require 'faker'
require 'betterlorem'
require 'csv'



Region.destroy_all
Country.destroy_all
County.destroy_all
Town.destroy_all
User.destroy_all
Route.destroy_all
Kind.destroy_all
Surface.destroy_all
RegionRoute.destroy_all
RouteLocation.destroy_all


UpdateDatabase.new.call
