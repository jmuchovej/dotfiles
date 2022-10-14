import os
import pwd


shell = pwd.getpwnam(os.environ["USER"]).pw_shell
c.NotebookApp.terminado_settings = { "shell_command": [shell] }
