module ScormCloud
  class Destination < ScormCloud::BaseObject
    attr_accessor :id, :name, :created_by

    def self.from_xml(element)
      c = Destination.new
      c.set_attributes(element.attributes)
      c
    end
  end
end
