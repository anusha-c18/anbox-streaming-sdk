#!/bin/sh -ex
#
# Copyright 2024 Canonical Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ANBOX_STREAMING_SDK_DIR="$PWD/../../"

docker run --rm \
  -v "$ANBOX_STREAMING_SDK_DIR:/anbox-streaming-sdk-js" \
  node:20 \
  bash -c "cd /anbox-streaming-sdk-js/tests/e2e && \
           npm ci && \
           npx playwright install --with-deps && \
           npm run test:coverage && \
           chown -R $(id -u ${USER}):$(id -g ${USER}) coverage"
