# Auto_using_bash
This project focuses on creating a Bash script that automates essential system maintenance tasks such as backup, old file cleanup, and notification sending. The goal is to help users automate repetitive or critical operations on their system, making it easier to manage backups, free up disk space, and ensure that any issues are reported promptly.
Features:

    Automated Backup:
        The script allows users to create a compressed backup of a designated folder.
        The backup is stored in a specified directory, with the backup file named based on the current date.

    Old Backup Cleanup:
        To save disk space, the script automatically removes backup files that are older than a user-defined number of days.
        This helps prevent the accumulation of unnecessary backup files.

    Notification System:
        If the backup process fails, the script can send a notification to the user. This can be a simple terminal message or an email, depending on the setup.
        The notifications help ensure that the user is informed of any issues, especially if they are not monitoring the system regularly.

    Logging:
        Every time the script runs, it generates log entries to keep a detailed record of the operations (successful backups, cleanup actions, failures, etc.).
        Logs are stored in the backup directory for easy tracking and troubleshooting.

    Cron Integration:
        The script can be scheduled to run automatically at regular intervals (e.g., daily, weekly) using Cron jobs, ensuring that backups and cleanups happen without manual intervention.

How it Works:

    User Inputs: The script prompts the user for the following information:
        Source directory: The folder that needs to be backed up.
        Backup directory: Where the backup files should be stored.
        Retention period: How many days old the backups should be before they are deleted.

    Backup Process:
        The script uses tar to create a compressed archive (.tar.gz) of the source directory.
        It then stores the archive in the backup directory, appending the current date to the filename to ensure uniqueness.

    Cleanup Process:
        The script finds and deletes backup files in the backup directory that are older than the user-specified retention period (e.g., 7 days).
        This prevents the backup directory from growing indefinitely and filling up disk space.

    Error Handling & Notification:
        If an error occurs during the backup process (e.g., if the source folder doesn’t exist or the backup folder is inaccessible), the script records the error in the log file.
        Additionally, the script can notify the user about the failure, either by displaying a message in the terminal or by sending an email (if configured).

    Logging:
        All actions, whether successful or not, are logged in a log file. This allows the user to check the history of backup and cleanup operations.

Technologies Used:

    Bash (Bourne Again Shell): The primary scripting language used for writing the script.
    Cron: A Linux job scheduler to automate the script execution at predefined times (e.g., daily).
    Tar: A Unix utility used to create compressed archive files (.tar.gz).
    Mail (optional): A utility for sending email notifications (can be set up if desired).

Use Cases:

    Personal Backup Solution: Automatically back up important personal or work files (documents, photos, etc.) on a regular basis.
    System Maintenance: Use this script in server environments to ensure regular backups of configuration files, databases, or logs.
    Disk Space Management: Automatically clean up old backups to manage disk space usage effectively.

Potential Enhancements:

    Configuration File: Add a configuration file to allow users to specify source and backup directories, retention days, and email settings without modifying the script.
    Custom Notifications: Extend the notification system to send more detailed reports, including backup sizes, number of files, or detailed error messages.
    Encryption: Add an option to encrypt backup files for added security, especially for sensitive data.

This project provides a simple yet powerful tool for automating critical system tasks, improving efficiency, and ensuring that backups and cleanups happen consistently without user intervention.
