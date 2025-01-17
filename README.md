# ESX_DATASTORE SCRIPT

<div align="center">

# 🌐 **Host Smarter with Fusiora.com!** 🚀  

<img src="https://fusiora.com/assets/img/branding/content/logo_white.svg" alt="Fusiora Logo" width="400">  

🖥️ **Premium hardware** in **Netherlands**, **Miami**, & **Germany**.  
🛡️ **DDoS protection** for **any game**.  
💸 Use **`CODELY`** for **10% OFF**!  

## 🔗 [**Start Hosting Now**](https://fusiora.com)  

</div>

# Features
- Works with multichars (no memory leaks)
# Download & Installation
 - Drop everything from `datastore` excluding "property", "user_ears", "user_glasses", "user_helmet", "user_mask"
 - Then drop everything from `datastore_data` excluding "property", "user_ears", "user_glasses", "user_helmet", "user_mask" (otherwise it won't work)
 - Put this esx_datastore to your server and type `start esx_datastore` in server.cfg (or any other config you execute on the server start)

# Description
This datastore is used to work with most of MultiCharacter scripts. Also, this datastore won't kill server, because other modified datastore uses much of RAM and with more players, the server will be killed. This empties cached data of users, which has disconnected, so it actually stores only the datastores of connected users. Aldo, it checks datastore not on server start, but on playerConnect, so if you update their identifier in datase, ther will be NO problem (specially MultiCharacter scripts do that)
The disadvantage is that it does NOT support datatstores for weapons, so if your scripts are using it, it won't work. For this case, there is `sqz_unijob`, which has its own table in database ti store weapons so it is not affected by datastore and it WILL work.

# Issues
In case of any issues, let me know, you have 2 ways. You can create a GitHub issue or event you can join our Discord server and let me know in the Discord server.
1) Remember to provide screenshot from the client/error console, if you see any errors
2) Provide repro steps how can I reproduce that issue

# Other Scripts
* [sqz_unijob](https://forum.cfx.re/t/esx-sqz-unijob-advanced-system-for-easy-adding-jobs/2100467) - Script for adding multiple jobs into 1 script just by edditing config
* [sqz_drugs](https://forum.cfx.re/t/esx-sqz-drugs-advanced-drug-system/2167691) - Complete system for drugs, planting, harvesting, watering, processing and dealing drugs
* [scb_rpmenu](https://forum.cfx.re/t/esx-scb-rpmenu-facilitates-all-works-player-menu-admin-menu/2110753) - Complete RP menu with all features you could need for your RP server
* [sqz_switchjob](https://github.com/czsquizer/switchjob) - Script for switching and having multiple jobs
* [sqz_carmenu](https://github.com/czsquizer/sqz_carmenu) - Script for all the car features you would ever need
* [sqz_hospital](https://github.com/czsquizer/sqz_hospital) - Script that allows player heal themselves in the hospital in case there are no doctors on your server
* [sqz_itemwhitelist](https://github.com/czsquizer/sqz_itemwhitelist) - Prop and vehicle whitelist/blacklist to prevent hackers spamming your server with entities
* [others](https://github.com/czsquizer?tab=repositories) - You can find there my forks of other scripts, check them as well

# Visit Squizer's "social media"
* [Tebex](https://sqz.tebex.io/)
* [Page](https://squizer.cz)
* [Cfx.re Forum](https://forum.cfx.re/u/squizer/)
* [Discord](https://discord.gg/FVXAu2F)
* [GitHub](https://github.com/czsquizer/)
### Editted by Squizer#3020

You can edit it however you want, but you are not allowed to rename it/sell it/republish it as your.


## This is editted esx_datastore, link to its original author https://github.com/esx-framework/esx_datastore
