# #!/bin/bash

# get_git_status() {
#   CURRENT_DIR=$(tmux display-message -p "#{pane_current_path}")

#   WINDOW_NAME=$(tmux display-message -p '#W' | xargs)

#   if [ "$WINDOW_NAME" = "ssh" ]; then
#     echo " $WINDOW_NAME  "

#   elif [ "$WINDOW_NAME" = "ftp" ] || [ "$WINDOW_NAME" = "gftp" ]; then
#     echo " ftp  "

#   elif [ "$WINDOW_NAME" = "tmux" ] || [ "$WINDOW_NAME" = "[tmux]" ]; then
#     echo " tmux  "


#   elif [ -d "$CURRENT_DIR/.git" ]; then
#     # Obter o nome da branch atual
#     branch=$(cd "$CURRENT_DIR" && git rev-parse --abbrev-ref HEAD)

#     # Obter o número de ficheiros modificados
#     modified=$(cd "$CURRENT_DIR" && git status --porcelain | grep '^ M' | wc -l | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

#     # Obter o número de ficheiros apagados
#     deleted=$(cd "$CURRENT_DIR" && git status --porcelain | grep '^ D' | wc -l | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

#     # Obter o número de ficheiros adicionados
#     added=$(cd "$CURRENT_DIR" && git status --porcelain | grep '^??' | wc -l | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

#     # Obter o número de ficheiros no staging area (antes do commit)
#     staged=$(cd "$CURRENT_DIR" && git diff --cached --name-only | wc -l | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

#     # Obter o número de commits a fazer push (depois do commit)
#     #push_commits=$(cd "$CURRENT_DIR" && git rev-list --count --left-only @{u}...HEAD 2>/dev/null)

#     # Obter o número de commits a fazer pull
#     #pull_commits=$(cd "$CURRENT_DIR" && git rev-list --count --right-only @{u}...HEAD 2>/dev/null)

#     # Verificar se o branch tem upstream configurado
#     #if [ -z "$push_commits" ] || [ -z "$pull_commits" ]; then
#     #    push_commits="0"
#     #    pull_commits="0"
#     #fi

#     if [ "$modified" -gt 0 ]; then
#       modified_="#[fg=#f0c674]#[fg=default]"
#     else
#       modified_="#[fg=#f0c674]󱨈#[fg=default]"
#     fi

#     if [ "$deleted" -gt 0 ]; then
#       deleted_="#[fg=#a54242]#[fg=default]"
#     else
#       deleted_="#[fg=#a54242]󱨈#[fg=default]"
#     fi

#     if [ "$added" -gt 0 ]; then
#       added_="#[fg=#8c9440]#[fg=default]"
#     else
#       added_="#[fg=#8c9440]󱨈#[fg=default]"
#     fi

#     if [ "$staged" -gt 0 ]; then
#       staged_="#[fg=#5e8d87]󰼏#[fg=default]"
#     else
#       staged_="#[fg=#5e8d87]󰼎#[fg=default]"
#     fi  


    
#     #docker=$(docker images -q | wc -l | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

  
#     # Imprimir os resultados
#     echo " git on  $branch #[fg=default]$added_ $modified_ $deleted_ $staged_ "
#   else
#     echo ""
#   fi
# }


# LOG_FILE="/tmux_plugin.log"

# log_message() {
#   local message="$1"
#   echo "$(date '+%Y-%m-%d %H:%M:%S') [sh] $message" >> "$LOG_FILE"
# }


# get_git_status





#!/bin/bash
get_git_status() {
  CURRENT_DIR=$(tmux display-message -p "#{pane_current_path}")

  WINDOW_NAME=$(tmux display-message -p '#W' | xargs)

  if [ "$WINDOW_NAME" = "ssh" ]; then
    echo " #[fg=#8a8c95]$WINDOW_NAME  "

  elif [ "$WINDOW_NAME" = "docker" ]; then
    echo " #[fg=#8a8c95]$WINDOW_NAME 󰡨 "

  elif [ "$WINDOW_NAME" = "ftp" ] || [ "$WINDOW_NAME" = "gftp" ]; then
    echo " #[fg=#8a8c95]ftp  "

  elif [ "$WINDOW_NAME" = "tmux" ] || [ "$WINDOW_NAME" = "[tmux]" ]; then
    echo " #[fg=#8a8c95]tmux  "

  elif [ -d "$CURRENT_DIR/.git" ]; then
    echo " #[fg=#8a8c95]git  "

  else
    echo " #[fg=#8a8c95]$WINDOW_NAME  "
  fi
}

get_git_status
