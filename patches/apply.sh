#!/bin/bash

cd ../../../../frameworks/av 
git apply -v ../../device/tinno/v3702/patches/frameworks_av.patch
cd ../../system/core
git apply -v ../../device/tinno/v3702/patches/system_core.patch
cd ../..
git apply -v ./device/tinno/v3702/patches/tinno.patch
git apply -v ./device/tinno/v3702/patches/mtp.patch

