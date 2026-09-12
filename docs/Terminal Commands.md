### pull the sqlite database file from android using adb

```
adb shell "run-as com.example.flutter_komorebi dd if=files/my_database.sqlite" > komorebi.sqlite

adb exec-out run-as com.example.flutter_komorebi cat files/my_database.sqlite > komorebi.sqlite
```

### look at the files inside your app data

```
adb shell

run-as com.example.flutter_komorebi


```

### restarting adb

```
adb kill-server
adb start-server
```
