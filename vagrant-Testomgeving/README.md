# Testomgeving

Deze testomgeving kan je gebruiken om het project te runnen van het Devops project. Maar eerst moet je (eenmalig) enkele dingen instellen.

## Voorbereiding

### Installatie software

Voor de testomgeving heb volgende software nodig:

- [Vagrant](https://www.vagrantup.com/)
- [Virtualbox](https://www.virtualbox.org/)
- [testomgeving](https://github.com/HoGentTIN/devops-project-ops-2122-h8-ops/tree/main/vagrant-Testomgeving)

> Je kan vagrant en virtualbox makkelijk installeren a.d.h.v het [installatiescript](../docs/scripts/VagrantInstaller.ps1)

### Configuratie testomgeving

In [vagrant-hosts.yml](vagrant-hosts.yml) moet je het pad naar de repository van de webapplicatie zetten

>Opgelet! Gebruikt `\\` in plaats van `\`

```yml
- name: srv001
  ip: 192.168.56.31
  projectPath:  C:\\Users\\Pieter\\workspaces\\devops-project-web-h8\\Europart
```

## VM opstarten

Je kan de vm opstarten door in de root van de testomgeving (`vagrant-testomgeving`) via een terminal-venster het commando `vagrant up`.  
De testomgeving zal opstarten maar dit kan even duren.

Wacht tot het alles doorlopen is en je terug een prompt ziet

```bash
PS E:\Documents\School Repo's\Devops\devops-project-ops-2122-h8-ops\vagrant-Testomgeving>
```

Nu kan je de webapplicatie testen door naar de `192.168.56.31:5001` te surfen.

Als je een aanpassing doet en dit opnieuw wil testen gebruik je het commando `vagrant provision`, daarna ververs je het browservenster.

Ben je klaar met programmeren? Dan kan je de testomgeving afsluiten door het commando `vagrant halt` te gebruiken.
