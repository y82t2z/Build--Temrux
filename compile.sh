#!/usr/bin/env bash

BASE_DIR="$PWD"
cd kernel
KERNEL_DIR="$PWD"
AK3_DIR=$BASE_DIR/AnyKernel3

[[ ! -d "$AK3_DIR" ]] && echo -e "(X) Please Provide AnyKernel3 !" && exit
export PATH="$BASE_DIR/clang/bin:$PATH" && 
export PATH="../clang/bin:$PATH" 
TC="Zyc Clang"
TARGET=alioth
CODENAME=POCO-F3
KERNEL_NAME=ALIOTH

K_IMG=$KERNEL_DIR/out/arch/arm64/boot/Image
K_DTBO=$KERNEL_DIR/out/arch/arm64/boot/dtbo.img
K_DTB=$KERNEL_DIR/out/arch/arm64/boot/dtb

export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER=y82t2z
export KBUILD_BUILD_HOST=Neko-CI
export TZ=Asia/Bangkok

send_msg(){
        curl -s -X POST \
                https://api.telegram.org/bot"$TOKEN"/sendMessage \
                -d chat_id="$CHATID" \
                -d text="$1" \
                -d "parse_mode=html" \
                -d "disable_web_page_preview=true"
}

send_file(){
        curl -s -X POST \
                https://api.telegram.org/bot"$TOKEN"/sendDocument \
                -F chat_id="$CHATID" \
                -F document=@"$1" \
                -F caption="$2" \
                -F "parse_mode=html" \
                -F "disable_web_page_preview=true"
}