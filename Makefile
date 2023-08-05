TARGET := iphone:clang:latest
INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_PACKAGE_SCHEME = rootless
export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ClearClassicScene
$(TWEAK_NAME)_CFLAGS = -fno-objc-arc -Wno-module-import-in-extern-c
$(TWEAK_NAME)_FRAMEWORKS = Foundation UIKit
$(TWEAK_NAME)_FILES = init.mm

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/tool.mk
