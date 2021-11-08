# Handleiding

In deze handleiding leggen we kort uit hoe je de testomgeving lokaal op je eigen pc opzet.

De testomgeving werkt met Vagrant, dit is de software die ervoor zorgt dat de omgeving automatisch wordt opgezet doormiddel van 1 commando.

**benodigde software:**

- [Vagrant](https://www.vagrantup.com/)
- [Virtualbox](https://www.virtualbox.org/)
- [testomgeving](https://github.com/HoGentTIN/devops-project-ops-2122-h8-ops/tree/main/vagrant-Testomgeving)

> Je kan deze software ofwel zelf installeren, ofwel run je het script van in [Stap 2](#2-installeren-van-vagrant)

---

## 1. De testomgeving clonen

Clone deze github repo:
[DevopsTestomgeving](https://github.com/Vic-Rottiers/DevopsTestomgeving)

## 2. Installeren van Vagrant

Voor het installeren van Vagrant en virtualbox run je de schortcut van het `VagrantInstaller.ps1` script.

Dit bevindt zich in de `/docs` folder.
>Je kan best de shortcut in de root van `/docs` runnen, zo voorkom je eventuele problemen met administrator privileges bij de installatie.

## 3. De applicatie klaarmaken

Om de lokale testomgeving te kunnen gebruiken moet er aan de solution nog een paar dockerfile's toegevoegd worden. Dit gebruikt de testomgeving als instructies om de applicatie te builden, en vervolgens in de testomgeving klaar te zetten.

Controleer of volgende bestanden aanwezig zijn, en voeg ze toe indien nodig:

- Kopieer de 3 bestanden uit Dockerfiles en zet ze in de root van het project  
  (dus in de `\devops-project-web-h8\Europart` map)

## 4. De testomgeving opzetten

Om de testomgeving 'aan' te zetten, open je de map `vagrant-Testomgeving` in Visual Studio Code.  

In [vagrant-hosts.yml](vagrant-hosts.yml) moet je het pad naar de repository van de webapplicatie zetten

>Opgelet! Gebruikt `\\` in plaats van `\`

```yml
- name: srv001
  ip: 192.168.56.31
  projectPath:  C:\\Users\\Pieter\\workspaces\\devops-project-web-h8\\Europart
```


Open een terminal, hier type je de commando's om de testomgeving te besturen.

Commando's:

- Testomgeving aanzetten: `vagrant up`
  - Hou er rekening mee dat als je dit voor de eerste keer doet, het wel lang kan duren voor de machine helemaal opgezet is.
  - Normaal gezien duurt dit niet al te lang, als je hem de volgende keer opstart.  
  Wacht tot het alles doorlopen is en je terug een prompt ziet:  

    ```bash
    PS E:\Documents\School Repo's\Devops\devops-project-ops-2122-h8-ops\vagrant-Testomgeving>
    ```

- Testomgeving stopzetten: `vagrant halt`
  - Als je klaar bent met werken, zet je de testomgeving terug uit met dit commando
- Testomgeving opnieuw 'builden': `vagrant provision`
  - Tijdens je aan het programmeren bent en een changes wilt testen kan je via dit commando de applicatie opnieuw 'builden' in de testomgeving. Hierdoor moet de hele omgeving niet constant opnieuw van 0 opgebouwd worden als je changes in de app wilt testen.

Je kan de webapplicatie testen door naar het ip `192.168.56.31:5001` te surfen.