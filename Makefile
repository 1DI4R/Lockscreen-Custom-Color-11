include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LSCustomColor11
LSCustomColor11_FILES = Tweak.xm
LSCustomColor11_LIBRARIES = colorpicker


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += lscustomcolor11prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
