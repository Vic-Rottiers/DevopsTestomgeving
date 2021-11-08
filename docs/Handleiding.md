# Handleiding

In deze handleiding leggen we kort uit hoe je de testomgeving lokaal op je eigen pc opzet.

De testomgeving werkt met Vagrant, dit is de software die ervoor zorgt dat de omgeving automatisch wordt opgezet doormiddel van 1 commando.

**benodigde software:**

- Vagrant
- Virtualbox
- Visual Studio Code

Je kan deze software ofwel zelf installeren, ofwel run je het script van in [Stap 2](#2-installeren-van-vagrant)

---

## 1. De testomgeving clonen

Clone deze github repo:
<https://github.com/HoGentTIN/devops-project-ops-2122-h8-ops>

## 2. Installeren van Vagrant

Voor het installeren van Vagrant en virtualbox run je de schortcut van het `VagrantInstaller.ps1` script.

Dit bevindt zich in de `/docs` folder.

## 3. De applicatie klaarmaken

Om de lokale testomgeving te kunnen gebruiken moet er aan de solution nog een dockerfile toegevoegd worden. Dit gebruikt de testomgeving als instructies om de applicatie te builden, en vervolgens in de testomgeving klaar te zetten.

1. Rechterklik op het project dat je wil als backend draaien (ik ga ervan uit dat dit EuropArt.Server is?)
2. klik op Add -> Docker support
3. Er wordt normaal gezien een Dockerfile aangemaakt binnen het .Server project. Als dit gebeurd is deze stap in orde.


## 4. De testomgeving opzetten

om de testomgeving 'aan' te zetten, open je de map `vagrant-Testomgeving` in Visual Studio Code.  
Je moet nog 1 ding aanpassen in een van de bestanden, namelijk in `vagrant-hosts.yml`.  
Bij `projectPath` moet het pad komen waar de applicatie lokaal bij jou staat.

Open een terminal, hier type je de commando's om de testomgeving te besturen.

Commando's:

- Testomgeving aanzetten: `vagrant up`
  - Hou er rekening mee dat als je dit voor de eerste keer doet, het wel lang kan duren voor de machine helemaal opgezet is.
  - Normaal gezien duurt dit niet al te lang, als je hem de volgende keer opstart.
- Testomgeving stopzetten: `vagrant halt`
  - Als je klaar bent met werken, zet je de testomgeving terug uit met dit commando
- Testomgeving opnieuw 'builden': `vagrant provision`
  - Tijdens je aan het programmeren bent en een changes wilt testen kan je via dit commando de applicatie opnieuw 'builden' in de testomgeving. Hierdoor moet de hele omgeving niet constant opnieuw van 0 opgebouwd worden als je changes in de app wilt testen.
