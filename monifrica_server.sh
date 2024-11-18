#!/bin/bash

# Enable Apache modules
echo "Enabling necessary Apache2 modules..."
sudo a2enmod rewrite ssl

# Configure the firewall
echo "Configuring the firewall..."
sudo ufw allow 'Apache Full'
sudo ufw enable

# Add a new user
read -p "Enter new username: " username
if id "$username" &>/dev/null; then
    echo "User $username already exists. Skipping user creation."
else
    sudo adduser $username
    sudo usermod -aG sudo $username
    echo "User $username added successfully."
fi

echo "Server setup complete!"



































