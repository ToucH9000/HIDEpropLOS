# PIFvayuLOS
Magisk module to fix Play Integrity in LineageOS for POCO X3 Pro. Before flashing the module, if you want to use recommended "pif.json", you need to delete "pif.json" in data/adb partion otherwise module will use your custom made "pif.json".

## Bonus Stuff
See [Details](Details.md) for more power.<br><br>
**More about ["pif.json"](https://github.com/juleast/GeneratePIF)**<br>
If FIRST_API_LEVEL is greater than 32 it will force a hardware attestation. If is is null or empty, the module will set it to default value 23 (Android 6.0).<br>
```
"FIRST_API_LEVEL": null
```

## Still Confused?
Check out my [Mobile Setup](https://github.com/ToucH9000/Mobile-Specification) to know what's happening. Whenever i find something usefull, i always update that repo.

## Credits
[ez-me](https://github.com/ez-me)<br>
[osm0sis](https://github.com/osm0sis)<br>
[HuskyDG](https://github.com/HuskyDG)
