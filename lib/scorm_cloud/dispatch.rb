module ScormCloud
  class Dispatch < ScormCloud::BaseObject
    attr_accessor :id, :destination_id, :app_id,:course_app_id,:course_id,:enabled,:notes,:open,:version,:tags,:created_by,:create_date,:update_date,:registrationcap

    def self.from_xml(element)
      d = Dispatch.new
      d.set_attributes(element.attributes)
      element.children.each do |element|
        d.set_attr(element.name, element.text)
      end
      d
    end
  end
end
