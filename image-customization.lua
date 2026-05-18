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

packages({
	'iwinfo',
	'ffac-autoupdater-wifi-fallback',
	'respondd-module-airtime',
	'ffac-weeklyreboot',
	'ffmuc-mesh-vpn-wireguard-vxlan',
})

-- device has no reset button and requires a special package to go into setup mode
-- https://github.com/freifunk-gluon/community-packages/tree/master/ffda-network-setup-mode
if device({
	'zyxel-nwa55axe',
}) then
	packages {'ffda-network-setup-mode'}
	broken(false)
end

if target('ramips', 'mt7621') or target('mediatek', 'mt7622') or target('mediatek', 'filogic') then
	-- restart device if mt7915e driver shows known failure symptom
	packages {
		'ffac-mt7915-hotfix',
	}
end

if device({
	'avm-fritz-box-7530',
	'avm_fritzbox-7530',
	'avm-fritzbox-7520'
	}) then
	disable()
end
