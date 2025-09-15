#!/bin/bash

# backup.sh - Script pentru crearea backup-urilor automate
# Utilizare: ./backup.sh <director_sursa> [director_backup]

# Verifică dacă a fost furnizat cel puțin primul argument
if [[ $# -lt 1 ]]; then
    echo "Eroare: Lipsește directorul sursă." >&2
    echo "Utilizare: $0 <director_sursa> [director_backup]" >&2
    exit 1
fi

# Atribuie argumentele
SOURCE_DIR="$1"
BACKUP_DIR="${2:-/backup}"

# Verifică dacă directorul sursă există
if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Eroare: Directorul sursă '$SOURCE_DIR' nu există." >&2
    exit 1
fi

# Verifică dacă directorul de backup există, dacă nu îl creează
if [[ ! -d "$BACKUP_DIR" ]]; then
    mkdir -p "$BACKUP_DIR"
    if [[ $? -ne 0 ]]; then
        echo "Eroare: Nu s-a putut crea directorul de backup '$BACKUP_DIR'." >&2
        exit 1
    fi
fi

# Generează numele fișierului cu data curentă
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
SOURCE_BASENAME=$(basename "$SOURCE_DIR")
BACKUP_FILENAME="${SOURCE_BASENAME}_${TIMESTAMP}.tar.gz"
BACKUP_PATH="${BACKUP_DIR}/${BACKUP_FILENAME}"

# Creează arhiva tar.gz
tar -czf "$BACKUP_PATH" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# Verifică dacă backup-ul a fost creat cu succes
if [[ $? -eq 0 ]]; then
    echo "Backup creat cu succes: $BACKUP_PATH"
else
    echo "Eroare: Backup-ul a eșuat." >&2
    exit 1
fi

