#!/bin/bash
xmake
cp build/cross/arm/release/*.ko ~/nfs/root
