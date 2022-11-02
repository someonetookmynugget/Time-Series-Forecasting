# Copyright (c) 2021-2022, NVIDIA CORPORATION. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ARG FROM_IMAGE_NAME=nvcr.io/nvidia/pytorch:21.12-py3
FROM ${FROM_IMAGE_NAME}

# Set workdir and python path
WORKDIR /workspace
ENV PYTHONPATH /workspace

RUN apt update && apt install -y p7zip-full
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install requirements

ADD requirements.txt /workspace/requirements.txt
RUN pip install --no-cache-dir -r /workspace/requirements.txt

# Add model files to workspace
ADD . /workspace


