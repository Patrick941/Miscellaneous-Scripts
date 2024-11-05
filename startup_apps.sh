#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/patrick/.Xauthority

college_base_path="$HOME/Documents/Year5Semester1"
github_base_url="https://github.com/Patrick941"
module_list=("IntegratedSystemDesign" "MachineLearning" "MAIProject" "QuantumComputing")
blackboard_urls=("https://tcd.blackboard.com/ultra/courses/_89225_1/cl/outline")
github_names=("Integrated-System-Design" "MachineLearning" "MAIProject" "Quantum-Computing")

monitor_widths=("1920" "5360" "7280")

counter=0

for module in "${module_list[@]}"; do
    source /home/patrick/Documents/scripts/open_windows.sh -m "$module" -p "$college_base_path" -b "${blackboard_urls[*]}" -g "$github_base_url" -n "$github_name" -w "${monitor_widths[*]}"
done