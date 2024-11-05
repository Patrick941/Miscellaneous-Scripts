script_dir=$(dirname "$(realpath "$0")")
source "$script_dir/ipManager.sh" -p

repo_dir="$HOME/.secrets"
ip_path="$repo_dir/current_ip.txt"
file_contents=$(cat "$ip_path")
echo "IP: $file_contents"
ssh -i "$HOME/.ssh/id_rsa" "patrick@$file_contents"