obj-$(CONFIG_MSM_VIDC_V4L2) += vidc/
obj-$(CONFIG_MSM_WFD) += wfd/
obj-$(CONFIG_DVB_MPQ) += dvb/

ifeq ($(CONFIG_MSMB_CAMERA_LEGACY),y)
obj-$(CONFIG_MSMB_CAMERA) += camera_v1/
else
obj-$(CONFIG_MSMB_CAMERA) += camera_v2/
endif
obj-y += vcap/
