FROM debian:latest
LABEL author="mothfox"
WORKDIR /cpuv
SHELL ["bash"]
ADD "./pkgs.sh" "~/pkgs.sh"