# esx_datastore

## Download & Installation
 - Drop everything from `datastore` excluding "property", "user_ears", "user_glasses", "user_helmet", "user_mask"
 - Then drop everything from `datastore_data` excluding "property", "user_ears", "user_glasses", "user_helmet", "user_mask" (otherwise it won't work)
 - Put this esx_datastore to your server and type `start esx_datastore` in server.cfg (or any other config you execute on the server start)

## Description
This datastore is used to work with most of MultiCharacter scripts. Also, this datastore won't kill server, because other modified datastore uses much of RAM and with more players, the server will be killed. This empties cached data of users, which has disconnected, so it actually stores only the datastores of connected users. Aldo, it checks datastore not on server start, but on playerConnect, so if you update their identifier in datase, ther will be NO problem (specially MultiCharacter scripts do that)
The disadvantage is that it does NOT support datatstores for weapons, so if your scripts are using it, it won't work. For this case, there is `sqz_unijob`, which has its own table in database ti store weapons so it is not affected by datastore and it WILL work.

## TOS:
- You are NOT allowed to share the code with other people that do not have access to it
- You are NOT allowed to try to decrypt it
- Any leaking and breaking the TOS may and WILL lead to blacklisting your IPs, ban from the Discord and adding you to Blacklist.

## This is editted esx_datastore, link to its original author https://github.com/esx-framework/esx_datastore