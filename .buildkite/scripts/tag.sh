#!/bin/bash


docker tag buildkite-agent:latest 620422829213.dkr.ecr.us-east-1.amazonaws.com/buildkite-agent:$BUILDKITE_BRANCH
