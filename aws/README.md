# AWS CLI Installation Script

This script installs AWS CLI and ensures that you have the latest version each time it's run. It follows an idempotent approach, meaning it only installs or updates AWS CLI if necessary.

## Prerequisites

- Linux environment
- Bash shell
- Internet connection

## Usage

1. Download and run the script:
   ```
   curl -O https:// |bash
   ```

   If AWS CLI is already installed, the script will check for updates and prompt you to update if a newer version is available. If AWS CLI is not installed, it will be installed automatically.

4. Follow the on-screen instructions during the installation/update process.

5. Once the script completes, you should have the latest version of AWS CLI installed on your system.

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request on the [GitHub repository](https://github.com/jonmatum/dotfiles).

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
