# Charger
ifeq ($(WITH_BAIKALOS_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.baikalos
endif

# things to be set on AB devices
ifeq ($(TARGET_IS_AB_DEVICE),true)
    AB_OTA_UPDATER := true
endif

ifeq ($(TARGET_USE_MUSICFX),false)
    TARGET_USE_NO_MUSICFX := true
endif

include vendor/baikalos/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/baikalos/config/BoardConfigQcom.mk
endif

include vendor/baikalos/config/BoardConfigSoong.mk
