#!/bin/bash

# Randomly determine whether to make a commit
# With 12 runs per day and ~60-70% commit probability, we'll get ~7-8 commits per day
# Using a range of 0-9 and committing on values 0-6 gives us 70% probability
commitDecision=$((RANDOM % 10))  # 0-9

# If commitDecision is within 0-6 (70% chance), we make a commit, otherwise exit
if [ $commitDecision -gt 6 ]; then
    echo "Skipping commit this time"
    exit 0
fi

# Define an array of messages with more realistic and meaningful development messages
messages=(
    "🐞 Fixed URL validation bug in shortener service"
    "🚀 Implemented analytics dashboard feature"
    "🧹 Refactored link management module"
    "🔄 Merged backend pagination enhancements"
    "⚡ Optimized database query performance"
    "🌱 Added new redirect tracking capabilities"
    "📄 Updated API documentation with examples"
    "🔧 Fixed CORS issues in API endpoints"
    "✨ Enhanced user authentication system"
    "🔒 Implemented security fixes for XSS vulnerabilities"
    "📱 Improved mobile responsiveness across views"
    "🧪 Added unit tests for core components"
    "📦 Updated dependency packages to latest versions"
    "🎨 Redesigned dashboard UI for better usability"
    "💾 Optimized database schema for link storage"
    "🔍 Added search functionality for links"
    "🧩 Modularized shared components for reuse"
    "🌐 Added support for international URLs"
    "📊 Implemented click-through analytics"
    "🛡️ Enhanced rate limiting for API protection"
    "📌 Fixed redirect chain handling"
    "🏁 Performance optimized frontend bundle"
    "📬 Improved email notification service"
    "👤 Enhanced user profile management"
    "🌟 Added link tagging and categorization"
    "🗄️ Optimized caching strategy for popular links"
    "📈 Improved analytics data aggregation"
    "⚙️ Updated configuration for production deployment"
    "🔗 Enhanced custom domain support"
)

# Generate a random number to select a message from the array
randomNum=$(($RANDOM % ${#messages[@]}))

# Get the current date and time
currentTimestamp=$(date '+%B %d, %Y at %I:%M %p')

# Check if update.md exists, and create it if it doesn't
if [ ! -e "update.md" ]; then
    touch update.md
    git add update.md
fi

# Append text to update.md, indicating the last update time
echo "## 🤔 LAST UPDATED ON: ${currentTimestamp}" >update.md

# Configure local Git user information
git config --local user.email "28ananthaprakash@gmail.com"
git config --local user.name "Ananthaprakash"

# Commit changes to the repository with a random message and the current timestamp
# git commit -am: commit all modified files and provide a commit message in a single command
# a (all): Automatically add all modified files in the working directory
# m (message): Specify the commit message that describes the purpose of the commit
git commit -am "${messages[$randomNum]} on ${currentTimestamp}"