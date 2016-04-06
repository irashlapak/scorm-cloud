module ScormCloud
  class TaggingService < BaseService
    not_implemented :get_learner_tags, :set_learner_tags, :add_learner_tag,
      :remove_learner_tag, :get_registration_tags, :set_registration_tags,
      :add_registration_tag, :remove_registration_tag

    def get_course_tags(course_id)
      xml = connection.call("rustici.tagging.getCourseTags", { courseid: course_id })
      xml.elements["/rsp/tags"].map &:text
    end

    def set_course_tags(course_id, tags)
      xml = connection.call("rustici.tagging.setCourseTags", { courseid: course_id, tags: tags })
      !xml.elements["/rsp/success"].nil?
    end

    def add_course_tag(course_id, tag)
      xml = connection.call("rustici.tagging.addCourseTag", { courseid: course_id, tag: tag })
      !xml.elements["/rsp/success"].nil?
    end

    def remove_course_tag(course_id, tag)
      xml = connection.call("rustici.tagging.removeCourseTag", { courseid: course_id, tag: tag })
      !xml.elements["/rsp/success"].nil?
    end
  end
end