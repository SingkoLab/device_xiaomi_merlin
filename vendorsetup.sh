# ROM source patches

color="\033[0;32m"
end="\033[0m"

# Configure the patches path
patchDir="device/xiaomi/merlin/patches"
echo -e "${color}Patches Path: ${patchDir}${end}"
sleep 1

echo -e "${color}Applying patches...${end}"
sleep 1

# Patch RenderEngineThreaded
echo -e "${color}Applying RenderEngineThreaded patches!${end}"
rm -rf frameworks/native/libs/renderengine/threaded/RenderEngineThreaded.cpp
cp ${patchDir}/frameworks/native/libs/renderengine/threaded/RenderEngineThreaded.cpp frameworks/native/libs/renderengine/threaded/

# Patch media codec issues
echo -e "${color}Applying Media Codec patches!${end}"
rm -rf frameworks/av/include/media/MediaExtractorPluginHelper.h
rm -rf frameworks/av/media/libmediaplayerservice/nuplayer/include/nuplayer/GenericSource.h
rm -rf frameworks/av/media/libmediaplayerservice/nuplayer/include/nuplayer/NuPlayerSource.h
rm -rf frameworks/av/media/libmediaplayerservice/nuplayer/GenericSource.cpp
rm -rf frameworks/av/media/libmediaplayerservice/nuplayer/NuPlayerDecoder.cpp
rm -rf frameworks/av/media/libstagefright/include/media/stagefright/ACodec.h
rm -rf frameworks/av/media/libstagefright/include/media/stagefright/MediaCodecSource.h
rm -rf frameworks/av/media/libstagefright/ACodec.cpp
rm -rf frameworks/av/media/libstagefright/MediaCodecSource.cpp
rm -rf frameworks/av/media/libstagefright/omx/OMXNodeInstance.cpp
rm -rf frameworks/av/media/libstagefright/omx/SimpleSoftOMXComponent.cpp
rm -rf frameworks/av/media/mediaserver/mediaserver.rc
rm -rf frameworks/av/media/extractors/ogg/OggExtractor.cpp
rm -rf frameworks/av/services/mediacodec/seccomp_policy/mediaswcodec-arm.policy
rm -rf frameworks/av/services/mediaextractor/mediaextractor.rc

cp ${patchDir}/frameworks/av/include/media/MediaExtractorPluginHelper.h frameworks/av/include/media/
cp ${patchDir}/frameworks/av/media/libmediaplayerservice/nuplayer/include/nuplayer/GenericSource.h frameworks/av/media/libmediaplayerservice/nuplayer/include/nuplayer/
cp ${patchDir}/frameworks/av/media/libmediaplayerservice/nuplayer/include/nuplayer/NuPlayerSource.h frameworks/av/media/libmediaplayerservice/nuplayer/include/nuplayer/
cp ${patchDir}/frameworks/av/media/libmediaplayerservice/nuplayer/GenericSource.cpp frameworks/av/media/libmediaplayerservice/nuplayer/
cp ${patchDir}/frameworks/av/media/libmediaplayerservice/nuplayer/NuPlayerDecoder.cpp frameworks/av/media/libmediaplayerservice/nuplayer/
cp ${patchDir}/frameworks/av/media/libstagefright/include/media/stagefright/ACodec.h frameworks/av/media/libstagefright/include/media/stagefright/
cp ${patchDir}/frameworks/av/media/libstagefright/include/media/stagefright/MediaCodecSource.h frameworks/av/media/libstagefright/include/media/stagefright/
cp ${patchDir}/frameworks/av/media/libstagefright/ACodec.cpp frameworks/av/media/libstagefright/
cp ${patchDir}/frameworks/av/media/libstagefright/MediaCodecSource.cpp frameworks/av/media/libstagefright/
cp ${patchDir}/frameworks/av/media/libstagefright/omx/OMXNodeInstance.cpp frameworks/av/media/libstagefright/omx/
cp ${patchDir}/frameworks/av/media/libstagefright/omx/SimpleSoftOMXComponent.cpp frameworks/av/media/libstagefright/omx/
cp ${patchDir}/frameworks/av/media/mediaserver/mediaserver.rc frameworks/av/media/mediaserver/
cp ${patchDir}/frameworks/av/media/extractors/ogg/OggExtractor.cpp frameworks/av/media/extractors/ogg/
cp ${patchDir}/frameworks/av/services/mediacodec/seccomp_policy/mediaswcodec-arm.policy frameworks/av/services/mediacodec/seccomp_policy/
cp ${patchDir}/frameworks/av/services/mediaextractor/mediaextractor.rc frameworks/av/services/mediaextractor/

echo -e "${color}Patch applied successfully.${end}"
