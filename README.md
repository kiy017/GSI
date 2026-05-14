
## 📋 Supported ROM Types

When running the workflow, you can select from the following configurations:
- `Pixel` (Google)
- `OneUI` (Samsung)
- `MIUIGeneric` (Xiaomi/Poco/Redmi)
- `HyperOS` (New Xiaomi)
- `HMD` (Nokia/HMD Global)

## 🛠️ How to Use (GitHub Actions)


## 💻 Local Usage (Manual)

If you prefer to run this on your own Linux machine (Ubuntu/Debian), follow these steps:

### 1. Install System Dependencies
```bash
sudo apt-get update
sudo apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils \
rar uudeview mpack arj cabextract rename liblzma-dev python3-pip brotli \
lz4 protobuf-compiler git gawk
```

### 2. Install Python Dependencies
```bash
pip3 install backports.lzma protobuf twrpdtgen extract-dtb pycryptodome
```

### 3. Run the Script
Make sure `LinkToGSI.sh` is executable 

```bash
chmod +x LinkToGSI.sh
bash LinkToGSI.sh <Firmware_URL> <ROM_Type>
```

**Example:**
```bash
bash LinkToGSI.sh https://dl.google.com/dl/android/aosp/lynx-bp1a.zip Pixel
```

## ⚠️ Requirements

*   **Script**: This repository must contain the `LinkToGSI.sh` script in the root directory.
*   **Space**: The GitHub Runner has limited disk space (~14GB free). Very large firmware files may fail to extract.
*   **Link**: The firmware link provided must be a direct link (no captchas or wait times).

## ⚖️ Disclaimer

*   This tool is for development and testing purposes.
*   I am not responsible for bricked devices, dead SD cards, or thermonuclear war.
*   Please check your device's specific GSI compatibility before flashing.
