module ScormCloud
  class DispatchService < BaseService
    not_implemented  :get_destination_info

    def create_destination(name)
      xml = connection.call("rustici.dispatch.createDestination", { name: name })
      xml.elements['//destinationId'].text
    end

    def update_destination(destination_id, name)
      xml = connection.call("rustici.dispatch.updateDestination", { destinationid: destination_id, name: name })
      !xml.elements["/rsp/success"].nil?
    end

    def get_dispatch_list(page=1, dispatch_args = {})
      xml = connection.call("rustici.dispatch.getDispatchList", dispatch_args.merge(page: page))
      xml.elements["/rsp/dispatches"].map { |e| Dispatch.from_xml(e) }
    end

    def get_dispatch_info(dispatch_id)
      xml = connection.call("rustici.dispatch.getDispatchInfo", { dispatchid: dispatch_id })
      Dispatch.from_xml(xml.elements["/rsp/dispatch"])
    end

    def get_destination_list(page=1)
      xml = connection.call("rustici.dispatch.getDestinationList", { page: page })
      xml.elements["/rsp/dispatchDestinations"].map { |e| Destination.from_xml(e) }
    end

    def delete_destination(destination_id)
      xml = connection.call("rustici.dispatch.deleteDestination", { destinationid: destination_id })
      !xml.elements["/rsp/success"].nil?
    end

    def create_dispatch(course_id, destination_id, dispatch_attrs = {})
      xml = connection.call("rustici.dispatch.createDispatch", dispatch_attrs.merge({ courseid: course_id, destinationid: destination_id }))
      xml.elements['//dispatchId'].text
    end

    def delete_dispatches(dispatch_id)
      xml = connection.call("rustici.dispatch.deleteDispatches", { dispatchid: dispatch_id })
      !xml.elements["/rsp/success"].nil?
    end

    def download_dispatches(dispatch_attrs = {})
      connection.call_raw("rustici.dispatch.downloadDispatches", dispatch_attrs)
    end

    def update_dispatches(dispatch_attrs = {})
      xml = connection.call("rustici.dispatch.updateDispatches", dispatch_attrs)
      !xml.elements["/rsp/success"].nil?
    end

    def download_dispatches_by_destination(destinationid)
      connection.call_raw("rustici.dispatch.downloadDispatches", { destinationid: destinationid })
    end

    def download_dispatches_by_course(courseid)
      connection.call_raw("rustici.dispatch.downloadDispatches", { courseid: courseid })
    end
  end
end
