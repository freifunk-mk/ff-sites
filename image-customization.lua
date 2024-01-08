##	gluon site.mk makefile example

##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed

features({
	'autoupdater',
	'config-mode-mesh-vpn',
	'config-mode-domain-select',
	'ebtables-filter-multicast',
	'ebtables-filter-ra-dhcp',
	'ebtables-limit-arp',
	'mesh-batman-adv-15',
	'respondd',
	'status-page',
	'web-advanced',
	'web-wizard',
})

## gluon airtime
## autoupdater wifi falback
##	GLUON_SITE_PACKAGES
#		Specify additional Gluon/OpenWrt packages to include here;
#		A minus sign may be prepended to remove a packages from the
#		selection that would be enabled by default or due to the
#		chosen feature flags

packages({
	'iwinfo',
	'ffac-autoupdater-wifi-fallback',
	'respondd-module-airtime',
	'ffac-weeklyreboot',
	'ffmuc-ipv6-ra-filter',
	'ffmuc-mesh-vpn-wireguard-vxlan',
})
