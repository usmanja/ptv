# Use an official Ubuntu base image
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    ubuntu-desktop \
    x11-xserver-utils \
    dbus-x11 \
    x11-xserver-xorg-core \
    x11-xserver-xorg-input-all \
    x11-xserver-xorg-video-all \
    x11-xserver-xorg-legacy \
    gnome-core \
    gnome-session \
    vlc \
    sudo

# Create a new user 'unroot'
RUN useradd -ms /bin/bash unroot && echo 'unroot:password' | chpasswd && adduser unroot sudo

# Set the display environment variable
ENV DISPLAY :0

# Start the GNOME session
CMD ["gnome-session"]
