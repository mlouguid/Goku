#!/bin/bash

echo "Choose the type of project to set up:"
select choice in "Laravel" "WordPress"; do
    case $choice in
        Laravel )
            TYPE="laravel"
            break;;
        WordPress )
            TYPE="wordpress"
            break;;
        * )
            echo "Invalid option. Please choose 1 or 2.";;
    esac
done

# Ask for project folder name
read -p "Enter the name of your project folder: " PROJECT_NAME

# Set absolute path
PROJECT_DIR="$(pwd)/$PROJECT_NAME"

# Create the project directory
mkdir -p "$PROJECT_DIR"

# Generate project
if [ "$TYPE" = "laravel" ]; then
    echo "Creating Laravel project in $PROJECT_DIR..."
    docker run --rm -v "$PROJECT_DIR":/app composer create-project laravel/laravel /app
elif [ "$TYPE" = "wordpress" ]; then
    echo "Creating WordPress project in $PROJECT_DIR..."
    curl -o "$PROJECT_DIR/latest.tar.gz" https://wordpress.org/latest.tar.gz
    tar -xzf "$PROJECT_DIR/latest.tar.gz" -C "$PROJECT_DIR"
    mv "$PROJECT_DIR/wordpress/"* "$PROJECT_DIR"
    rm -rf "$PROJECT_DIR/wordpress" "$PROJECT_DIR/latest.tar.gz"
fi

# Replace the volume config in docker-compose.yml with the chosen folder
echo "Updating docker-compose.yml to use ./$PROJECT_NAME as PHP project root..."
sed -i.bak "s|./services/web/php|./$PROJECT_NAME|g" docker-compose.yml

# Build and run containers
echo "Starting Docker containers..."
docker-compose up -d --build

echo "✅ Done. Your $TYPE project is now running in Docker."
