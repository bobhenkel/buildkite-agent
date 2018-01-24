#!/bin/bash
docker tag pnet-buildkite-agent:latest 620422829213.dkr.ecr.us-east-1.amazonaws.com/buildkite-agent:latest
docker push 620422829213.dkr.ecr.us-east-1.amazonaws.com/buildkite-agent:latest
