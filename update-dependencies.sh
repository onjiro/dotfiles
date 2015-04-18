#!/bin/bash

git subtree pull --squash --prefix=z git@github.com:rupa/z.git master
git subtree pull --squash --prefix=ruby-build git@github.com:sstephenson/ruby-build.git master
git subtree pull --squash --prefix=.rbenv git@github.com:sstephenson/rbenv.git master
