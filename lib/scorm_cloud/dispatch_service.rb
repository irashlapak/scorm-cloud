module ScormCloud
  class DispatchService < BaseService
    not_implemented :get_destination_list, :get_destination_info, :get_dispatch_list, :get_dispatch_info,
      :create_dispatch, :update_dispatches, :download_dispatches, :delete_dispatches

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
  end
end