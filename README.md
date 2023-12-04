# PIFvayuLOS
Magisk module to fix Play Integrity in LineageOS for POCO X3 Pro. Google has forced us all to fight with different fingerprints. This module is no longer working, you need to add prop values in "pif.json" to make it work and repack n flash, make sure that there's no "pif.json" exist in data/adb partion before flashing repacked module. If "pif.json" already exist in adb/data partion then there's no need of reflashing module just change "pif.json" values and then clear data and cache of "Google Play Store" and "Google Play Services". Good luck finding working fingerprint.

## Bonus Stuff
See [Details](Details.md) for more power.<br><br>
More about "pif.json"
For empty value you can write this line like this.<br>
'''"FIRST_API_LEVEL": null'''

## Still Confused?
Check out my [Mobile Setup](https://github.com/ToucH9000/Mobile-Specification) to know what's happening. Whenever i find something usefull, i always update that repo.

## Credits
[ez-me](https://github.com/ez-me)<br>
[osm0sis](https://github.com/osm0sis)<br>
[HuskyDG](https://github.com/HuskyDG)
