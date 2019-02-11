include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = LSCustomColor11Prefs
LSCustomColor11Prefs_FILES = LCPRootListController.m
LSCustomColor11Prefs_INSTALL_PATH = /Library/PreferenceBundles
LSCustomColor11Prefs_FRAMEWORKS = UIKit
LSCustomColor11Prefs_PRIVATE_FRAMEWORKS = Preferences
LSCustomColor11Prefs_LIBRARIES = colorpicker


include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LSCustomColor11Prefs.plist$(ECHO_END)
