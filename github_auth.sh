#!/usr/bin/env bash

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github
ssh -T git@github.com
