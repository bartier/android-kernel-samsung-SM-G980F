# android-kernel-samsung-SM-G980F

This is the official Samsung kernel source for the Galaxy S20 (SM-G980F), with minimal modifications to ensure it compiles successfully. The source was downloaded directly from Samsung's official open source release portal.

## 📦 Source Information

- Device: Samsung Galaxy S20 (SM-G980F)
- Firmware version: G980FXXSFHWB1
- Source archive: SM-G980F_13_Opensource.zip - 197.60 MB
- Downloaded from: [Samsung Open Source Release Center](https://opensource.samsung.com/main)

## Ensure toolchain folder is available

The toolchain used for this specific build (G980FXXSFHWB1) must be set up before building:

1. [Download the toolchain](https://drive.google.com/file/d/15FWoYQxdWrxgQNYbI0t-FBJ5YVtCw4oB/view?usp=sharing)
2. Extract the contents to: `toolchain/ folder in the root directory of this repository`

Alternatively, you can obtain the toolchain from Google's AOSP repository:
- [Google Source](https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/)
- Note: Compatibility validation will be required if using this alternative source

---

# Samsung Galaxy S20 (SM-G980F) Kernel Build Guide

> All compilation must be done inside the Docker container.

## Build the Docker image

Ensure you have Docker installed on your system. Then, on the root folder of this repository, execute:

```bash
docker build --platform linux/amd64 -t kernel-builder .
docker run --platform linux/amd64 -it --rm -v "$(pwd):/kernel" kernel-builder
```

## Inside the container: ensure you are in the kernel directory

```bash
cd /kernel
```

## Build the kernel using the wrapper script

Run the wrapper:
```bash
./build_kernel.sh
```

Kernel image will be available at: `arch/arm64/boot/Image`
