#!/bin/bash

if [ -z "$BUILDKITE_AGENT" ]
then
      docker tag buildkite-agent:latest 620422829213.dkr.ecr.us-east-1.amazonaws.com/buildkite-agent:$BUILDKITE_BRANCH
else
      docker tag buildkite-agent:latest 620422829213.dkr.ecr.us-east-1.amazonaws.com/buildkite-agent:$BUILDKITE_TAG
fi
