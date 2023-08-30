# ROM source patches

color="\033[0;32m"
end="\033[0m"

# Clone dependencies
echo -e "${color}Cloning dependencies..."
git clone --quiet https://github.com/Xiaomi-MT6768-Dev/proprietary_vendor_xiaomi --depth 1 vendor/xiaomi > /dev/null

git clone --quiet https://github.com/Xiaomi-MT6768-Dev/device_mediatek_sepolicy_vndr --depth 1 device/mediatek/sepolicy_vndr > /dev/null

git clone --quiet https://github.com/Xiaomi-MT6768-Dev/hardware_mediatek --depth 1 hardware/mediatek > /dev/null

git clone --quiet https://github.com/Xiaomi-MT6768-Dev/ViperFXAndroid --depth 1 packages/apps/ViperFX > /dev/null

git clone --quiet https://github.com/Xiaomi-MT6768-Dev/prebuilt-apps --depth 1 xiaomi-mt6768-dev/packages/prebuilt-apps > /dev/null
echo -e "Dependencies cloned successfully!"

echo -e "Deleting dtbo & kernel artifac"
rm -rf out/target/product/merlin/obj/DTBO_OBJ
rm -rf out/target/product/merlin/obj/KERNEL_OBJ

# Configure the patches path
patchDir="device/xiaomi/merlin/patches"
echo -e "Patches Path: ${patchDir}"

echo -e "Applying patches..."

# Patch RenderEngineThreaded
echo -e "Applying RenderEngineThreaded patches!"
rm -rf frameworks/native/libs/renderengine/threaded/RenderEngineThreaded.cpp
cp ${patchDir}/frameworks/native/libs/renderengine/threaded/RenderEngineThreaded.cpp frameworks/native/libs/renderengine/threaded/

# Patch media codec issues
echo -e "Applying Media Codec patches!"
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

echo -e "Patch applied successfully.${end}"
