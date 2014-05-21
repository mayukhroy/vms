module ApplicationHelper
def getServiceVendorName(vendor_id)
	return Vendor.find(vendor_id).name
end
end
