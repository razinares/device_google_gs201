#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/gs201/overlay-lineage

# AiAi Config
PRODUCT_COPY_FILES += \
    device/google/gs201/allowlist_com.google.android.as.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/allowlist_com.google.android.as.xml

# Camera
PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.camera.extensions.package=com.google.android.apps.camera.services \
    ro.vendor.camera.extensions.service=com.google.android.apps.camera.services.extensions.service.PixelExtensions

# Google Assistant
PRODUCT_PRODUCT_PROPERTIES += ro.opa.eligible_device=true

# EUICC
ifneq ($(BOARD_WITHOUT_RADIO),true)
# product permissions XML from stock
PRODUCT_COPY_FILES += \
    device/google/gs201/product-permissions-stock.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/product-permissions-stock.xml
endif

# HbmSVManager
PRODUCT_COPY_FILES += \
    device/google/gs201/conf/disable_hbmsv.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/disable_hbmsv.sh

# Lineage Health
include hardware/google/pixel/lineage_health/device.mk

# Pixel Parts
$(call inherit-product-if-exists, packages/apps/PixelParts/device.mk)

# Pixel Camera
$(call inherit-product-if-exists, vendor/google/camera/pixelcamera.mk)

# Face Unlock
$(call inherit-product-if-exists, vendor/google/faceunlock/device.mk)

# AudioFX
TARGET_EXCLUDES_AUDIOFX := true

# ViPER4AndroidFX
$(call inherit-product-if-exists, packages/apps/ViPER4AndroidFX/config.mk)


# Linker config
PRODUCT_VENDOR_LINKER_CONFIG_FRAGMENTS += \
    device/google/gs201/linker.config.json

# Memory Allocator
PRODUCT_USE_SCUDO := true

# Parts
PRODUCT_PACKAGES += \
    GoogleParts

# Touch
include hardware/google/pixel/touch/device.mk
