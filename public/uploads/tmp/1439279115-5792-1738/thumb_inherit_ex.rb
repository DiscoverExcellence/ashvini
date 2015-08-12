class Vehicle
  attr_accessor  :topspeed
  def initialize(topspeed,)
    @topspeed = topspeed
  end

  def race(*vehicles)
    return vehicles.max_by {|vehicle1| vehicle1.topspeed}
  end 
  def relay(distance,*group) 
    group.min_by{|groups|  p (distance.to_f/groups.length) * groups.inject(0){|time,vehicle| time+(1.0/vehicle.topspeed)}}
  end 
end
class TwoWheeler < Vehicle
  attr_accessor :accessories, :capability
  def initialize(name,fuel = "petrol",topspeed,accessories, capability)
    super(topspeed)
    @name = name
    @fuel = fuel
    @capability = capability
    @accessories = accessories
  end
  def iscovered
    false
  end
end
class FourWheeler < Vehicle
  attr_accessor :accessories, :capability,:iscovered
  #attr_accessor :name, :fuel,:iscovered
  def initialize(name,fuel,topspeed,accessories, capability,iscovered = true)
    super(topspeed)
    @name = name
    @fuel = fuel
    @iscovered = iscovered
    @capability = capability
    @accessories = accessories
  end
end
class  Boat < Vehicle
  attr_accessor :accessories, :capability,:iscovered
  def initialize(name,fuel = "petrol",topspeed,accessories, capability,iscovered)
    super(topspeed)
    @name = name
    @iscovered = iscovered
    @capability = capability
    @accessories = accessories
  end

end

class Bcart < Vehicle
  attr_accessor :accessories, :capability,:iscovered
  def initialize(name = "bcart",topspeed,accessories, capability,iscovered)
    super(topspeed)
    @name = name
    @iscovered = iscovered
    @capability = capability
    @accessories = accessories
  end
end

