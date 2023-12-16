# php-linter
PHP Syntax checker (lint) action
This action controls the syntax of php files in a directory, by default it excluding the vendor directory.

Inputs
scan_paths
The directory to control takes "." by Default.

Example usage
```
- name: PHP Syntax Checker (Lint)
  uses: AmChella/php-linter@7.4
  with:
    scan_paths: '.' or 'dir,dir2'
```
