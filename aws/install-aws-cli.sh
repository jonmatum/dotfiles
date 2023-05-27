#!/bin/bash

# Function to check if AWS CLI is installed
is_aws_cli_installed() {
    if command -v aws >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

# Function to get the latest version of AWS CLI
get_latest_aws_cli_version() {
    awscli_latest_version=$(curl -s "https://awscli.amazonaws.com/exe/linux-x86_64/latest_version")
    echo "$awscli_latest_version"
}

# Function to install AWS CLI
install_aws_cli() {
    echo "Installing AWS CLI..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf awscliv2.zip aws
    echo "AWS CLI installed successfully!"
}

# Main script
if is_aws_cli_installed; then
    current_version=$(aws --version | awk '{print $1}' | cut -d '/' -f2)
    latest_version=$(get_latest_aws_cli_version)
    echo "AWS CLI is already installed (current version: $current_version)."

    if [ "$current_version" != "$latest_version" ]; then
        echo "Updating AWS CLI to the latest version ($latest_version)..."
        sudo aws configure set cli_auto_prompt on
        sudo aws configure set cli_pager ""
        sudo aws configure set cli_follow_urlparam false
        sudo aws configure set cli_timestamp_format default
        sudo aws configure set default.region us-east-1
        sudo aws configure set default.output json
        sudo aws configure set default.color off
        sudo aws configure set default.s3.max_concurrent_requests 50
        sudo aws configure set default.s3.multipart_threshold 64MB
        sudo aws configure set default.s3.multipart_chunksize 16MB
        sudo aws configure set default.s3.max_bandwidth 50MB/s
        sudo aws configure set default.s3.max_queue_size 10000
        sudo aws configure set default.s3.multipart_threshold 64MB
        sudo aws configure set default.s3.multipart_chunksize 16MB
        sudo aws configure set default.s3.max_bandwidth 50MB/s
        sudo aws configure set default.s3.max_concurrent_requests 50
        sudo aws configure set default.s3.max_queue_size 10000
        sudo aws configure set default.s3.max_retries 10
        sudo aws configure set default.s3.max_backoff 300
        sudo aws configure set default.s3.s3utils ""
        sudo aws configure set default.s3api.max_concurrent_requests 50
        sudo aws configure set default.s3api.max_queue_size 10000
        sudo aws configure set default.s3api.max_bandwidth 50MB/s
        sudo aws configure set default.s3api.max_retries 10
        sudo aws configure set default.s3api.max_backoff 300
        sudo aws configure set default.s3api.s3utils ""
        sudo aws configure set default.s3api.multipart_threshold 64MB
        sudo aws configure set default.s3api.multipart_chunksize 16MB
        sudo aws configure set default.s3api.multipart_max_parts 10000
        sudo aws configure set default.s3api.multipart_max_part_num 10000
        sudo aws configure set default.s3api.multipart_max_pool_connections 10
        sudo aws configure set default.s3api.multipart_threshold 64MB
        sudo aws configure set default.s3api.multipart_chunksize 16MB
        sudo aws configure set default.s3api.multipart_max_parts 10000
        sudo aws configure set default.s3api.multipart_max_part_num 10000
        sudo aws configure set default.s3api.multipart_max_pool_connections 10
        sudo aws configure set default.s3api.multipart_threshold 64MB
        sudo aws configure set default.s3api.multipart_chunksize 16MB
        sudo aws configure set default.s3api.multipart_max_parts 10000
        sudo aws configure set default.s3api.multipart_max_part_num 10000
        sudo aws configure set default.s3api.multipart_max_pool_connections 10
        echo "AWS CLI updated successfully to version $latest_version."
    else
        echo "AWS CLI is already up to date."
    fi
else
    install_aws_cli
fi

