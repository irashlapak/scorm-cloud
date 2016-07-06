module ScormCloud
  class Dispatch < ScormCloud::BaseObject
    attr_accessor :id, :destination_id, :app_id, :course_app_id, :course_id, :enabled, :notes, :open,
      :version, :tags, :created_by, :create_date, :update_date, :registrationcap, :registrationcount,
      :instanced, :expiration_date

    def self.from_xml(element)
      d = Dispatch.new
      d.set_attributes(element.attributes)
      element.children.each do |element|
        value = element.name == 'tags' ? element.map(&:text) : element.text
        d.set_attr(element.name, value)
      end
      d
    end
  end
end
