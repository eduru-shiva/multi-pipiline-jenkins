#!/bin/bash

# Update package list
sudo apt update -y

# Install Java (OpenJDK 11)
sudo apt install -y openjdk-11-jdk

# Verify Java installation
java -version

# Add Jenkins repository key to the system
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository to the sources list
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list to include Jenkins
sudo apt update -y

# Install Jenkins
sudo apt install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins to start on boot
sudo systemctl enable jenkins

# Install Maven
sudo apt install -y maven

# Verify Maven installation
mvn -version

# Print Jenkins status
sudo systemctl status jenkins

echo "Java, Jenkins, and Maven installation completed successfully!"

