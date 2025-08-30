# android-kernel-samsung-SM-G980F

This is the official Samsung kernel source for the Galaxy S20 (SM-G980F), with minimal modifications to ensure it compiles successfully. The source was downloaded directly from Samsung's official open source release portal.

## 📦 Source Information

- Device: Samsung Galaxy S20 (SM-G980F)
- Firmware version: G980FXXSFHWB1
- Source archive: SM-G980F_13_Opensource.zip - 197.60 MB
- Downloaded from: [Samsung Open Source Release Center](https://opensource.samsung.com/main)

## Ensure toolchain folder is available

The toolchain used for this specific build (G980FXXSFHWB1) must be set up before building:

1. Download the toolchain from: https://drive.google.com/file/d/15FWoYQxdWrxgQNYbI0t-FBJ5YVtCw4oB/view?usp=sharing
2. Extract the contents to: `SM-G980F_13_Opensource/Kernel/toolchain`
3. The toolchain includes:
   - Clang compiler
   - GCC ARM64 cross-compiler
   - Build utilities

Alternatively, you can obtain the toolchain from Google's AOSP repository:
- Source: https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/
- Note: Compatibility validation will be required if using this alternative source

---

# Samsung Galaxy S20 (SM-G980F) Kernel Build Guide

> All compilation must be done inside the Docker container.

## Build the Docker image

```bash
docker build --platform linux/amd64 -t kernel-builder .
```

## Run the container with the kernel source mounted

```bash
docker run --platform linux/amd64 -it --rm -v "$(pwd)/SM-G980F_13_Opensource/Kernel:/kernel" kernel-builder
```

## Inside the container: change to the kernel directory

```bash
cd /kernel
```

## Build the kernel using the wrapper script

Make the wrapper executable:
```bash
chmod +x build_kernel.sh
```

Run the wrapper:
```bash
./build_kernel.sh
```

Kernel image will be available at: `arch/arm64/boot/Image`
