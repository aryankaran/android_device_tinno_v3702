# mt6580 platform boardconfig
LOCAL_PATH := device/tinno/v3702
-include device/tinno/v3702/libraries/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop
USE_CAMERA_STUB := true
TARGET_PROVIDES_INIT_RC := true

# Platform
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6580
TARGET_NO_BOOTLOADER := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_NO_FACTORYIMAGE := true

# CPU
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7

TARGET_BOOTLOADER_BOARD_NAME := mt6580

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL -DDISABLE_ASHMEM_TRACKING
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE

BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_USES_MTK_AUDIO := true
BOARD_USES_MTK_HARDWARE :=true

# Boot
BOARD_KERNEL_CMDLINE := \
    bootopt=64S3,32S1,32S1 \
    androidboot.selinux=permissive
    
BOARD_KERNEL_BASE := \
    0x80000000
    
BOARD_KERNEL_PAGESIZE := \
    2048
    
BOARD_MKBOOTIMG_ARGS := \
    --base 0x80000000 \
    --pagesize 2048 \
    --kernel_offset 0x00008000 \
    --ramdisk_offset 0x04000000 \
    --second_offset 0x80f00000 \
    --tags_offset 0x0e000000 \
    --board R09

NEW_KERNEL := false

ifeq ($(NEW_KERNEL),false)
    TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
    $(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
else
    TARGET_KERNEL_SOURCE := kernel/tinno/v3702
    TARGET_KERNEL_CONFIG := v3702_defconfig
    BOARD_KERNEL_IMAGE_NAME := zImage-dtb
    TARGET_NO_KERNEL := false
endif

TARGET_KMODULES := true

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Display
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Flags
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# GPS
BOARD_GPS_LIBRARIES := true
BOARD_MEDIATEK_USES_GPS := true

# FM
MTK_FM_SUPPORT := true
MTK_FM_RX_SUPPORT := true

# Consumerir
MTK_IRTX_SUPPORT := true

# MTK_WLAN_SUPPORT
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P

# build old-style zip files (required for ota updater)
BLOCK_BASED_OTA := false

# make_ext4fs requires numbers in dec format
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13474725888
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BLOCK_BASED_OTA := false

TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun/file"

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_USERIMAGES_USE_EXT4 := true

# TWRP
TWRP := false

ifeq ($(TWRP),true)
    TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
    BOARD_HAS_NO_SELECT_BUTTON := true
    TW_NO_REBOOT_BOOTLOADER := true
    TARGET_RECOVERY_FSTAB := device/tinno/v3702/recovery/root/etc/recovery.fstab
    TARGET_RECOVERY_DEVICE_DIRS += devi??e/tinno/v3702
    TW_THEME := portrait_hdpi
    RECOVERY_GRAPHICS_USE_LINELENGTH := true
    TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
    TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0/gadget/lun%d/file
    TW_MAX_BRIGHTNESS := 255
    RECOVERY_SDCARD_ON_DATA := true
    TW_DEFAULT_EXTERNAL_STORAGE := true
    TW_CRYPTO_FS_TYPE := "ext4"
    TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p20"
    TW_CRYPTO_MNT_POINT := "/data"
    TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,noauto_da_alloc,data=ordered"
    TW_NO_USB_STORAGE := true
    TW_EXCLUDE_SUPERSU := true
    TW_INCLUDE_FB2PNG := true
    TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone1/temp
    TW_EXTRA_LANGUAGES := true
    TW_BUILD_ZH_CN_SUPPORT := true
endif

ifeq ($(TARGET_BUILD_VARIANT),user)
    BOARD_SEPOLICY_DIRS := device/tinno/v3702/sepolicy_user
else
    BOARD_SEPOLICY_DIRS := device/tinno/v3702/sepolicy
endif

# Malloc implementation
MALLOC_IMPL := dlmalloc
       
# RIL
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril

#
TARGET_LDPRELOAD += libxlog.so:libmtk_symbols.so
BOARD_SECCOMP_POLICY := $(LOCAL_PATH)/seccomp
