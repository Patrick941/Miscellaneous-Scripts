#/bin/bash
college_base_path="$HOME/Documents/Year5Semester1"
github_base_url="https://github.com/Patrick941"
module_list=("IntegratedSystemDesign" "MachineLearning" "MAIProject" "QuantumComputing")
blackboard_urls=("https://tcd.blackboard.com/ultra/courses/_89225_1/cl/outline")
github_names=("Integrated-System-Design" "MachineLearning" "MAIProject" "Quantum-Computing")

monitor_widths=("1920" "5360" "7280")
module="QuantumComputing"
github_name="Quantum-Computing"

source /home/patrick/Documents/scripts/open_windows.sh -m "$module" -p "$college_base_path" -b "${blackboard_urls[*]}" -g "$github_base_url" -n "$github_name" -w "${monitor_widths[*]}"