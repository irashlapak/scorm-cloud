module ScormCloud
  class Launch < ScormCloud::BaseObject
    attr_accessor :id, :completion, :satisfaction, :measure_status,
      :normalized_measure, :experienced_duration_tracked, :launch_time,
      :exit_time, :update_dt

    def self.from_xml(xml)
      launch = Launch.new
      launch.set_attributes(xml.attributes)

      xml.children.each do |element|
        launch.set_attr(element.name, element.text)
      end

      launch
    end

  end
end