class Geoloc
  def geoloc
    results = Geocoder.search("Lieu unique nantes")
    puts results.first.coordinates
  end
end
