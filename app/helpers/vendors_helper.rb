module VendorsHelper
def getVendorCreatorName(user_id)
	return User.find(user_id).name
end
end
