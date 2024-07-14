# MySQL Backup Script

This script performs a backup of a MySQL database, compresses the backup file, and logs the backup operation. It is designed to be run manually ensure regular backups of your database.

## **Prerequisites**

- MySQL server must be installed and running.
- The user running the script must have the necessary permissions to perform a database backup.

## **Script Overview**

The script performs the following actions:
1. **Dumps the MySQL database** into a SQL file.
2. **Compresses the SQL file** to .gz .
3. **Logs the backup operation**.

## **Usage**

1. **Update Script Variables**: Modify the script variables to match your environment.
   - `USER`: The MySQL username.
   - `PASSWORD`: The MySQL user's password.
   - `NAME`: The name of the database to be backed up.
   - `BACKUP_DIR`: The directory where backups will be stored.

2. **Make Script Executable**: Ensure the script is executable by running:
   ```bash
   chmod +x /path/to/your/backup/script.sh
   ```

