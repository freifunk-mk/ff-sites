##	gluon site.mk makefile example

##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed

GLUON_FEATURES := \
	autoupdater \
	ebtables \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-limit-arp \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	radv-filterd \
	respondd \
	status-page \
	web-advanced \
	web-private-wifi \
	web-wizard 

##	GLUON_SITE_PACKAGES
#		Specify additional Gluon/OpenWrt packages to include here;
#		A minus sign may be prepended to remove a packages from the
#		selection that would be enabled by default or due to the
#		chosen feature flags


# eulenfunk:
GLUON_SITE_PACKAGES := \
        respondd-module-airtime \
	gluon-weeklyreboot \
	eulenfunk-hotfix \
	gluon-txpowerfix \
	gluon-banner \
	gluon-linkcheck \
	gluon-config-mode-geo-location-osm \
	gluon-authorized-keys \


# openwrt:
GLUON_SITE_PACKAGES += \
	haveged \
	iptables \
	iwinfo \
	socat
	

# support the USB stack
USB_PACKAGES_BASIC := \
	kmod-usb-core \
	kmod-usb2 \
	kmod-usb-hid

# FAT32 Support for USB
USB_PACKAGES_STORAGE := \
        block-mount \
        kmod-fs-ext4 \
        kmod-fs-vfat \
        kmod-usb-storage  \
        kmod-usb-storage-extras  \
        blkid  \
        swap-utils  \
        kmod-nls-cp1250  \
        kmod-nls-cp1251  \
        kmod-nls-cp437  \
        kmod-nls-cp775  \
        kmod-nls-cp850  \
        kmod-nls-cp852  \
        kmod-nls-cp866  \
        kmod-nls-iso8859-1  \
        kmod-nls-iso8859-13  \
        kmod-nls-iso8859-15  \
        kmod-nls-iso8859-2  \
        kmod-nls-koi8r  \
        kmod-nls-utf8

USB_PACKAGES_NET := \
        kmod-ath9k-htc \
        kmod-usb-net \
        kmod-usb-net-asix \
        kmod-usb-net-asix-ax88179 \
        kmod-usb-net-cdc-eem \
        kmod-usb-net-cdc-ether \
        kmod-usb-net-cdc-mbim \
        kmod-usb-net-cdc-ncm \
        kmod-usb-net-cdc-subset \
        kmod-usb-net-dm9601-ether \
        kmod-usb-net-hso \
        kmod-usb-net-huawei-cdc-ncm \
        kmod-usb-net-ipheth \
        kmod-usb-net-kalmia \
        kmod-usb-net-kaweth \
        kmod-usb-net-mcs7830 \
        kmod-usb-net-pegasus \
        kmod-usb-net-qmi-wwan \
        kmod-usb-net-rndis \
        kmod-usb-net-rtl8150 \
        kmod-usb-net-rtl8152 \
        kmod-usb-net-sierrawireless \
        kmod-usb-net-smsc95xx \
        kmod-mii \
        kmod-nls-base

TOOLS_PACKAGES := \
        usbutils


ifeq ($(GLUON_TARGET),x86-generic)
GLUON_SITE_PACKAGES += \
	htop \
	iftop \
	tcpdump \
        $(USB_PACKAGES_BASIC) \
        $(USB_PACKAGES_STORAGE) \
        $(USB_PACKAGES_NET) \
        $(TOOLS_PACKAGES)
endif

ifeq ($(GLUON_TARGET),x86-geode)
GLUON_SITE_PACKAGES += \
	htop \
	iftop \
	tcpdump \
        $(USB_PACKAGES_STORAGE) \
        $(USB_PACKAGES_NET) \
        $(TOOLS_PACKAGES)
endif

ifeq ($(GLUON_TARGET),x86-64)
GLUON_SITE_PACKAGES += \
	htop \
	iftop \
	tcpdump \
        $(USB_PACKAGES_BASIC) \
        $(USB_PACKAGES_STORAGE) \
        $(USB_PACKAGES_NET) \
        $(TOOLS_PACKAGES)
endif

ifeq ($(GLUON_TARGET),brcm2708-bcm2708)
GLUON_SITE_PACKAGES += \
        htop \
        iftop \
        tcpdump \
        $(USB_PACKAGES_BASIC) \
        $(USB_PACKAGES_STORAGE) \
        $(USB_PACKAGES_NET) \
        $(TOOLS_PACKAGES)
endif

ifeq ($(GLUON_TARGET),brcm2708-bcm2709)
GLUON_SITE_PACKAGES += \
        htop \
        iftop \
        tcpdump \
        $(USB_PACKAGES_BASIC) \
        $(USB_PACKAGES_STORAGE) \
        $(USB_PACKAGES_NET) \
        $(TOOLS_PACKAGES)
endif






##	DEFAULT_GLUON_RELEASE
#		version string to use for images
#		gluon relies on
#			opkg compare-versions "$1" '>>' "$2"
#		to decide if a version is newer or not.

#DEFAULT_GLUON_RELEASE := 2021.1.1.MG.exp-$(shell date '+%Y%m%d')
DEFAULT_GLUON_RELEASE := 21.1.1

# Variables set with ?= can be overwritten from the command line

##	GLUON_RELEASE
#		call make with custom GLUON_RELEASE flag, to use your own release version scheme.
#		e.g.:
#			$ make images GLUON_RELEASE=23.42+5
#		would generate images named like this:
#			gluon-ff%site_code%-23.42+5-%router_model%.bin

GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Default priority for updates.
GLUON_PRIORITY ?= 0

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Languages to include
GLUON_LANGS ?= en de

# Do not build images for deprecated devices
GLUON_DEPRECATED ?= full
