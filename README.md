# Script de Backup Automatizat

## Obiectiv

Acest script automatizează procesul de creare a backup-urilor pentru directoare importante din sistemul de operare Linux. Scriptul creează arhive comprimate `.tar.gz` cu timestamp-uri în numele fișierului pentru o organizare ușoară.

## Cum funcționează

Scriptul `backup.sh` primește ca parametri:
- **Director sursă** (obligatoriu) - directorul care va fi salvat în backup
- **Director backup** (opțional) - locația unde va fi salvat backup-ul (implicit: `/backup`)

### Procesul de backup:
1. Verifică dacă directorul sursă există
2. Verifică/creează directorul de destinație pentru backup
3. Generează un nume unic pentru arhivă folosind timestamp-ul curent
4. Creează arhiva comprimată `.tar.gz`
5. Confirmă succesul operațiunii


#### Sintaxă generală:
```bash
./backup.sh <director_sursa> [director_backup]
```

#### Exemple de utilizare:

**Backup cu directorul implicit (`/backup`):**
```bash
./backup.sh /home/user
```
![Screenshot](images/screenshot1.png)

**Backup cu director personalizat:**
```bash
./backup.sh /home/user /home/user/my_backups
```
![Screenshot](images/screenshot2.png)

**Backup pentru configurări sistem:**
```bash
./backup.sh /etc /var/backups
```

![Screenshot](images/screenshot3.png)

### Format nume fișier
Arhivele create vor avea formatul:
```
<nume_director>_<AAAAMMZZ_HHMMSS>.tar.gz
```
![Screenshot](images/screenshot4.png)

## Mesaje de eroare

Scriptul va afișa mesaje clare în cazul următoarelor erori:
- Director sursă lipsă sau inexistent
- Imposibilitatea creării directorului de backup
- Eșecul creării arhivei

