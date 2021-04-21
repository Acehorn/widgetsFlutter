flutter doctor -v

Should see a Java binary at: under Android toolchain, this is the dir where your keytool is location, mine was /Applications/Android Studio.app/Contents/jre/jdk/Contents/Home/bin/java

Replace java with keytool so in this case /Applications/Android Studio.app/Contents/jre/jdk/Contents/Home/bin/keytool

Run it directly, in my case I ran /Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home/bin/keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key

Follow prompt

The key.jks file will appear in your main dir. Normally somewhere in /Users/<username>/key.jks

Now build your android app with this keytool should solve your problem
