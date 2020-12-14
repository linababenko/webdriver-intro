## Installation locally
 ```
npm -v
node -v
 ```
##### Install JAVA and set JAVA_HOME:
 ```
 sudo apt update
 sudo apt install default-jdk
 java -version
 sudo update-alternatives --config java
 sudo nano /etc/environment
 JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
 source /etc/environment
 echo $JAVA_HOME
 ```
 ```
Output:
 /usr/lib/jvm/java-11-openjdk-amd64
```
##### Install Appium server:
```
sudo npm install -g appium
```
if there is an error, try:
`sudo npm install -g appium --unsafe-perm=true --allow-root`, then verify
`appium -v`

##### Download "Android studio" for getting image of emulator:
https://developer.android.com/

```
/home/YOUR_USERNAME/android-studio-ide-193.6626763-linux/android-studio/bin
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

sudo mv ~/android-studio /usr/local

Open:
cd /usr/local/android-studio
./studio.sh
```
(for Ubuntu) OR Download "Android studio" in Ubuntu software.

Next you should to download image of emulator for Android:

Open Android studio > Tools > AVD Manager > Download the current image of the phone

```
sudo npm i appium-doctor -g
appium-doctor
```

If `ANDROID_HOME is NOT set!` or `adb, android, emulator could not be found because ANDROID_HOME or ANDROID_SDK_ROOT is NOT set!`:

```
ls ~/.bash_profile

If there is an error
ls: cannot access '/home/YOUR_USERNAME/.bash_profile': No such file or directory

    touch ~/.bash_profile
    ls ~/.bash_profile
    nano /.bash_profile
```
In Android studio:
File > Other Settings > Default Project Structure... > and copy Android SDK location and JDK location.
In /.bash_profile file set PATH:
```
GNU nano 4.8              /home/YOUR_USERNAME/.bash_profile
export ANDROID_HOME="/home/YOUR_USERNAME/Android/Sdk"
export JAVA_HOME="/usr/local/android-studio/jre"
export PATH=${JAVA_HOME}/bin:$PATH
```



In the project:
 ```
source ~/.bash_profile
npm install
pip3 install selenium
npm install chromedriver --chromedriver_version=LATEST
```

#####Run emulator:
```
sudo npm install -g start-android-emulator
adb start-server
$ANDROID_HOME/emulator/emulator -avd Pixel_8.1 -writable-system

Open terminal window 2
emulator -list-avds

Output:
List of devices attached
Pixel_3
Pixel_8.1

```

## Troubleshooting

#####No Chromedriver found that can automate Chrome '61.0.3163'.
* Chrome driver is not installed. For an emulator, you can follow this link.
* The Chrome browser version might not match.

If you’re not sure if the device is connected, type this command:
```
 adb devices -l

 List of devices attached
 emulator-5557 device
```
You need to specify the correct path to Chromedriver like:
`chromedriverExecutable: 'node_modules/appium/node_modules/appium-chromedriver/chromedriver/linux/chromedriver_64'`

##### This version of ChromeDriver only supports Chrome version 84

Your version of ChromeDriver only supports the 84th Chrome browser.
Everything, which is needed to be done from your side is to execute the server with chromedriver_autodownload feature enabled (like appium --allow-insecure chromedriver_autodownload).
```
args:  {
    allowInsecure: "chromedriver_autodownload"
},
```
https://appium.io/docs/en/writing-running-appium/web/chromedriver/

```
npm show appium-chromedriver version
```



docker build -t wat .

For start appium server and emulator in Docker
```
sudo  docker run --privileged -d -p 6080:6080 -p 5554:5554 -p 5555:5555 -e DEVICE="Samsung Galaxy S6" --name android-container budtmo/docker-android-x86-8.1
```
More details: https://github.com/budtmo/docker-android

