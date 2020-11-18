THEOS_DEVICE_IP = localhost
THEOS_DEVICE_PORT = 2222
TARGET := iphone:clang:13.0:11.0
INSTALL_TARGET_PROCESSES = SpringBoard
export ARCHS = arm64 arm64e
FOR_RELEASE = 1
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = PowerUpCCModule
PowerUpCCModule_BUNDLE_EXTENSION = bundle
PowerUpCCModule_FILES = PowerUpCCModule.m
PowerUpCCModule_CFLAGS = -fobjc-arc
PowerUpCCModule_FRAMEWORKS = Foundation
PowerUpCCModule_PRIVATE_FRAMEWORKS = ControlCenterUIKit Preferences
PowerUpCCModule_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
