#
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

NOPATENT:=1

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := librtp_jni

LOCAL_SRC_FILES := \
	AudioCodec.cpp \
	AudioGroup.cpp \
	EchoSuppressor.cpp \
	RtpStream.cpp \
	util.cpp \
	rtp_jni.cpp

LOCAL_SRC_FILES += \
	G711Codec.cpp \
	GsmCodec.cpp

ifndef NOPATENT
LOCAL_SRC_FILES += \
	AmrCodec.cpp \

endif


LOCAL_SHARED_LIBRARIES := \
	libnativehelper \
	libcutils \
	libutils \
	libmedia \

ifndef NOPATENT
LOCAL_SHARED_LIBRARIES += \
	libstagefright_amrnb_common
endif

LOCAL_STATIC_LIBRARIES := libgsm

ifndef NOPATENT

LOCAL_STATIC_LIBRARIES += libstagefright_amrnbdec libstagefright_amrnbenc

endif

LOCAL_C_INCLUDES += \
	$(JNI_H_INCLUDE) \
	external/libgsm/inc \
	system/media/audio_effects/include \

ifndef NOPATENT
LOCAL_C_INCLUDES += \
	frameworks/base/media/libstagefright/codecs/amrnb/common/include \
	frameworks/base/media/libstagefright/codecs/amrnb/common/ \
	frameworks/base/media/libstagefright/codecs/amrnb/enc/include \
	frameworks/base/media/libstagefright/codecs/amrnb/enc/src \
	frameworks/base/media/libstagefright/codecs/amrnb/dec/include \
	frameworks/base/media/libstagefright/codecs/amrnb/dec/src \

endif

LOCAL_CFLAGS += -fvisibility=hidden



include $(BUILD_SHARED_LIBRARY)
