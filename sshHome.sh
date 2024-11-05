script_dir=$(dirname "$(realpath "$0")")
source "$script_dir/ipManager.sh" -p

repo_dir="$HOME/.secrets"
ip_path="$repo_dir/current_ip.txt"
file_contents=$(cat "$ip_path")
echo "IP: $file_contents"

### Add the following lines to your .bashrc as ssh from inside a script is inconsistent
# ip_path="$HOME/.secrets/current_ip.txt"
# alias homePC='~/Documents/scripts/sshHome.sh & ssh patrick@$(cat "$ip_path")'