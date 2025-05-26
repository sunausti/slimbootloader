#!/bin/bash
cp /local/external/edk2/Build/UefiPayloadPkgLegacy/DEBUG_GCC5/FV/UEFIPAYLOAD.fd PayloadPkg/PayloadBins/UefiNetBoot.fd

python BuildLoader.py build qemu -p "UefiNetBoot.fd:UEFI:Lzma"

 qemu-system-x86_64 -m 512M -machine q35 -nographic -serial mon:stdio -pflash Outputs/qemu/SlimBootloader.bin | tee qemu.log
