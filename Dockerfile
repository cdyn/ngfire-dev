# Use Ubuntu as the base image
FROM ubuntu:latest

# Run the initializion script
RUN ngfire_init.sh
