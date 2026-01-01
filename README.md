<p align="center">
  <img src= "https://github.com/bharathnaik2k/BMI-Check_Flutter/blob/main/android/app/src/main/res/mipmap-xhdpi/ic_launcher.png"/>
</p>

<p align="center">
    <h1 align="center">Self BMI</h1>
    <h4 align="center">Male and Female between 2 years to 120 years can check BMI Here</h4>

<h3 align="center"> Here’s a BMI (Body Mass Index) chart for both males and females. BMI is calculated based on weight (kg) and height (m²) and is the same for males and females, although body composition can differ. The categories for BMI interpretation are the same for both genders.</h3>

</p>


## 👁️ App Preview
<img src="https://github.com/bharathnaik2k/BMI-Check_Flutter/blob/main/preview.png"  />



<h1 align="center" style="border-bottom: none">
    <b>

###### Check All Screenshots [Here](https://github.com/bharathnaik2k/BMI-Check_Flutter/tree/main/screenshots) 

</h1>


<div align="center">
  <b>Download on</b>
  &nbsp;
  <a href="https://play.google.com/store/apps/details?id=com.bnltd.bmi_app">
    <img
      src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png"
      height="100"
      alt="Get it on Google Play"
      style="vertical-align: middle;"
    />
  </a>
</div>

<h1 align="center" style="border-bottom: none; vertical-align: middle;">
  Download on
  &nbsp;
  <a href="https://play.google.com/store/apps/details?id=com.bnltd.bmi_app">
    <img
      src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png"
      height="100"
      style="vertical-align: middle;"
    />
  </a>
</h1>

## 📦 App Version

## BMI Project Details
- when the app is opened it asks for weight and height
- enter weight and height then click on check button to show your BMI
- ### BMI showing Details
    - your BMI 1 to 18.4 its show Under Weight
    - 18.5 to 24.9 its show Normal Weight (Healthy Weight)
    - 25 to 29.9 its show Over Weight
    - 30 to 39.9 its show Obesity
    - your BMI 40 above its show Severe Obesity
- ### BMI Formula:
<p align="center">
  <img src= "https://mennohenselmans.com/wp-content/uploads/2022/06/bmi-formula.jpg"/>
</p>

### Here Some Sample BMI Values (Male & Female):
sample table for heights and weights with BMI values:

| Height (cm) | Weight (kg) | BMI  |Category         |
|-------------|-------------|------|-----------------|
| 150         | 40          | 17.8 | Underweight     |
| 160         | 50          | 19.5 | Normal weight   |
| 170         | 65          | 22.5 | Normal weight   |
| 180         | 80          | 24.7 | Normal weight   |
| 190         | 95          | 26.3 | Overweight      |
| 200         | 120         | 30.0 | Obesity Class 1 |


# 🐦 Shorebird Commands

## First-Time Build Using Shorebird
Use this command to create the initial Shorebird release (base version):
Note : use which one flutter version you are using in your project same as you are using in shorebird command otherwise it will give error ( example : your project is using flutter 3.10.0 use this Cmd : shorebird release android --flutter-version=3.10.0 )

```bash
shorebird release android --flutter-version=3.35.4
```


## Push Patch Update (OTA)
Use this command to push Dart-only updates (UI, logic, text fixes)
without uploading to the Play Store:

```bash
shorebird patch --platforms=android --release-version=1.0.7+7
```
