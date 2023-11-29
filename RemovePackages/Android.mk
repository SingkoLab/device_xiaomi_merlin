LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RemovePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := AndroidAutoStubPrebuilt AmbientSensePrebuilt
LOCAL_OVERRIDES_PACKAGES += Drive Eleven F-Droid F-DroidPrivilegedExtension
LOCAL_OVERRIDES_PACKAGES += Gallery2 DiagnosticsToolPrebuilt Jelly Jellyfish
LOCAL_OVERRIDES_PACKAGES += MaestroPrebuilt MatLog
LOCAL_OVERRIDES_PACKAGES += Maps MusicPlayerGO Gmail2
LOCAL_OVERRIDES_PACKAGES += GoogleCameraGo GoogleTTS PersonalSafety
LOCAL_OVERRIDES_PACKAGES += Recorder RecorderPrebuilt
LOCAL_OVERRIDES_PACKAGES += SafetyHubPrebuilt Snap
LOCAL_OVERRIDES_PACKAGES += Turbo TipsPrebuilt
LOCAL_OVERRIDES_PACKAGES += Velvet YouTube YouTubeMusicPrebuilt
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
