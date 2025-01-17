# Copyright (C) 2020 The LineageOS Project
# Copyright (C) 2020 The PixelExperience Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Vendor blobs
$(call inherit-product-if-exists, vendor/motorola/ali/ali-vendor.mk)

# Device Path
DEVICE_PATH := device/motorola/ali

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Screen density
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_CONFIG := normal

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/configs/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/camera/mot_ov12a10_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_ov12a10_chromatix.xml \
    $(DEVICE_PATH)/configs/camera/mot_ov5675_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_ov5675_chromatix.xml \
    $(DEVICE_PATH)/configs/camera/mot_s5k3p8sp_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_s5k3p8sp_chromatix.xml \
    $(DEVICE_PATH)/configs/camera/s5k4h7_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k4h7_chromatix.xml \
    $(DEVICE_PATH)/configs/camera/sdm450_mot_ali_camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/sdm450_mot_ali_camera.xml

# CameraGo
PRODUCT_PACKAGES += \
    CameraGo

# Dolby 
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml \
    $(DEVICE_PATH)/configs/audio/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(DEVICE_PATH)/configs/audio/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.1-service \
    com.android.nfc_extras \
    SecureElement \
    NfcNci \
    nqnfcee_access.xml \
    nqnfcse_access.xml \
    Tag

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(DEVICE_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.hcef.xml

# Init
PRODUCT_PACKAGES += \
	fstab.qcom \
	init.ali.rc

# Sensors
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf \
    $(DEVICE_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Thermal
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# Inherit from motorola msm8953-common
$(call inherit-product, device/motorola/msm8953-common/msm8953.mk)

#Soong target hals patch to caf
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/msm8996/display \
    hardware/qcom-caf/msm8996/media \
    hardware/qcom-caf/msm8996/audio \

