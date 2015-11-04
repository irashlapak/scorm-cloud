module ScormCloud
  class DispatchService < BaseService
    not_implemented :get_destination_list, :get_destination_info, :get_dispatch_list,
    :get_dispatch_info, :update_dispatches

    def create_destination(name)
      xml = connection.call("rustici.dispatch.createDestination", { name: name })
      xml.elements['//destinationId'].text
    end

    def update_destination(destination_id, name)
      xml = connection.call("rustici.dispatch.updateDestination", { destinationid: destination_id, name: name })
      !xml.elements["/rsp/success"].nil?
    end

    def delete_destination(destination_id)
      xml = connection.call("rustici.dispatch.deleteDestination", { destinationid: destination_id })
      !xml.elements["/rsp/success"].nil?
    end

    def create_dispatch(course_id, destination_id)
      xml = connection.call("rustici.dispatch.createDispatch", { courseid: course_id, destinationid: destination_id })
      xml.elements['//dispatchId'].text
    end

    def delete_dispatches(dispatch_id)
      xml = connection.call("rustici.dispatch.deleteDispatches", { dispatchid: dispatch_id })
      !xml.elements["/rsp/success"].nil?
    end

    def download_dispatches(dispatch_id)
      connection.call_raw("rustici.dispatch.downloadDispatches", { dispatchid: dispatch_id })
    end

    def download_dispatches_by_destination(destinationid)
      connection.call_raw("rustici.dispatch.downloadDispatches", { destinationid: destinationid })
    end
    
    def download_dispatches_by_course(courseid)
      connection.call_raw("rustici.dispatch.downloadDispatches", { courseid: courseid })
    end
  end
end
