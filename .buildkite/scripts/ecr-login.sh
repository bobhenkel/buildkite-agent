#!/bin/bash
-set e

eval $(awss ecr get-login --no-include-email --region us-east-1)
