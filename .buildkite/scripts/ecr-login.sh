#!/bin/bash -x
set -e

#eval 'aws ecr get-login --no-include-email --region us-east-1' & wait $! ; echo status=$?

eval $(aws ecr get-login --no-include-email --region us-east-1)
