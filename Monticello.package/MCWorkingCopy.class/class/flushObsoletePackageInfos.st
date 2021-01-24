cleanup
flushObsoletePackageInfos
	PackageOrganizer default flushObsoletePackages: [ : eachPackageInfo | eachPackageInfo class isObsolete ]