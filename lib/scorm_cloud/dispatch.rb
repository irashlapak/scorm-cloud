module ScormCloud
  class Dispatch < ScormCloud::BaseObject
    attr_accessor :id, :destination_id, :app_id,:courseApp_id,:course_id,:enabled,:notes

    def self.from_xml(element)
      c = Dispatch.new
      c.set_attributes(element.attributes)
      c
    end
  end
end
