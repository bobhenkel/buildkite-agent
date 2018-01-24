#!/bin/bash -x

if [ -z "$BUILDKITE_TAG" ]
then
      docker push 620422829213.dkr.ecr.us-east-1.amazonaws.com/buildkite-agent:$BUILDKITE_BRANCH
else
      docker push 620422829213.dkr.ecr.us-east-1.amazonaws.com/buildkite-agent:$BUILDKITE_TAG
fi
