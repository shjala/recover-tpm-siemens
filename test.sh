#!/bin/sh
# Copyright (c) 2024 Zededa, Inc.
# SPDX-License-Identifier: Apache-2.0

ECDH_INDEX=0x81000005
DEVKEY_INDEX=0x817FFFFF

echo "123456" > tpmcred

echo "Generate a new EK key and IDK, and test ECDHZGen..."
./recovertpm -test 3 -tpm-cred tpmcred -ecdh-index "$ECDH_INDEX" -devkey-index "$DEVKEY_INDEX" -test-count 100 -show-bar -test-key-regen
if [ $? -ne 0 ]; then
    echo "Test failed"
    exit 1
fi

rm -f tpmcred