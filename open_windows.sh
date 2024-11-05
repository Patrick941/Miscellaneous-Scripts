#/bin/bash
while getopts m:p:b:g:n:w: flag
do
    case "${flag}" in
        m) module=${OPTARG};;
        p) college_base_path=${OPTARG};;
        b) IFS=',' read -r -a blackboard_urls <<< "${OPTARG}";;
        g) github_base_url=${OPTARG};;
        n) github_name=${OPTARG};;
        w) IFS=',' read -r -a monitor_widths <<< "${OPTARG}";;
    esac
done

echo "Starting $module..."
code "$college_base_path/$module" &
gnome-terminal --working-directory="$college_base_path/$module" &
firefox --new-window "${blackboard_urls[0]}" &
sleep 2
firefox --new-tab "${github_base_url}/${github_name}" &
sleep 1
wmctrl -r "*${module} - Visual Studio Code" -e 0,"${monitor_widths[0]}",0,-1,-1
vscode_window_id=$(xdotool search --name "${module} - Visual Studio Code")
wmctrl -ir "$vscode_window_id" -b add,maximized_vert,maximized_horz

terminal_window_id=$(xdotool search --name "$module")
wmctrl -ir "$terminal_window_id" -e 0,0,0,-1,-1
wmctrl -ir "$terminal_window_id" -b add,maximized_vert,maximized_horz

firefox_window_id=$(xdotool search --name "Patrick941/${github_name}")
echo "Firefox window id: $firefox_window_id"
wmctrl -ir "$firefox_window_id" -b add,maximized_vert,maximized_horz