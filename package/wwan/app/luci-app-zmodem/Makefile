#
# Copyright (C) 2023 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=Luci for Modem Data Settings
LUCI_DEPENDS:=+kmod-usb-net +kmod-usb-core +kmod-usb-ohci +kmod-usb-serial +kmod-usb-serial-option +kmod-usb-uhci +kmod-usb2 +usb-modeswitch +usbutils +qfirehose +sendat

include $(TOPDIR)/feeds/luci/luci.mk

# $(eval $(call BuildPackage,luci-app-zmodem))
