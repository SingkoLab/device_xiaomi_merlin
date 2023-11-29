#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/xiaomi/merlin/device.mk)

# Inherit RisingOS vendor common stuffs.
$(call inherit-product, vendor/rising/config/rising.mk)

# RisingOS flags
WITH_GMS := false
TARGET_CORE_GMS := false
TARGET_PREBUILT_PIXEL_LAUNCHER := false
TARGET_ENABLE_PIXEL_FEATURES := true
TARGET_ENABLE_BLUR := true
INLINE_KERNEL_BUILDING := true

RISING_MAINTAINER := SingkoLab
RISING_CHIPSET := mt6768
RISING_STORAGE := 64GB
RISING_RAM := 4GB
RISING_BATTERY := 5020mAh
RISING_DISPLAY := 1080×2340
RISING_PACKAGE_TYPE := VANILLA

PRODUCT_NAME := rising_merlin
PRODUCT_DEVICE := merlin
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 9

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="merlin-user 11 RP1A.200720.011 V12.5.4.0.RJOMIXM release-keys"

BUILD_FINGERPRINT := Redmi/merlin/merlin:11/RP1A.200720.011/V12.5.4.0.RJOMIXM:user/release-keys
