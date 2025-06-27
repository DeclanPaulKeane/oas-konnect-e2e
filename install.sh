#! /bin/bash

deck file openapi2kong --spec ./openapi.yaml --output-file kong.yaml
deck file add-plugins -s kong.yaml -o kong.yaml ./plugins/*
deck file patch -s kong.yaml -o kong.yaml ./patches/*
deck file add-tags -s kong.yaml -o kong.yaml "$1"
deck file kong2tf -s kong.yaml -o ./service.tf