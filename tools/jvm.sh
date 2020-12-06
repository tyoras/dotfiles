#!/bin/bash

echo -e "\n-- Downloading coursier and installing jvm + apps"
curl -fLo cs https://git.io/coursier-cli-"$(uname | tr LD ld)"
chmod +x cs
./cs setup --yes --jvm graalvm-ce-java11 --env --apps ammonite,bloop,cs,giter8,sbt,scala,scalafmt
rm cs

echo -e "\n-- Installing Sdkman"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install maven
sdk install groovy
sdk install visualvm

