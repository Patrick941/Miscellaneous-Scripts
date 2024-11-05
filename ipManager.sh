#!/bin/bash

push_ip() {
  current_ip=$(curl -s http://checkip.amazonaws.com)
  repo_dir="$HOME/.secrets"

  if [ ! -f "$repo_dir/current_ip.txt" ] || [ "$(cat $repo_dir/current_ip.txt)" != "$current_ip" ]; then
    echo "$current_ip" > "$repo_dir/current_ip.txt"
    
    cd "$repo_dir"
    git add current_ip.txt
    git commit -m "Update IP to $current_ip"
    git push origin main --force
  else
    echo "No change in IP address. No update needed."
  fi
}

pull_ip() {
  repo_dir="$HOME/.secrets"
  
  cd "$repo_dir"
  git reset --hard HEAD
  git pull origin main
  latest_ip=$(cat "$repo_dir/current_ip.txt")
  echo "Latest IP from repository: $latest_ip"
}

while getopts "p" opt; do
  case $opt in
    p)
      pull_ip
      exit 0
      ;;
    *)
      echo "Usage: $0 [-p]"
      echo "  -p    Pull the latest IP from the remote repository"
      exit 1
      ;;
  esac
done

push_ip