#!/bin/bash


docker tag pnet-buildkite-agent:$BUILDKITE_BRANCH 620422829213.dkr.ecr.us-east-1.amazonaws.com/buildkite-agent:$BUILDKITE_BRANCH
