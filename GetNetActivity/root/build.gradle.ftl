//noinspection GradleCompatible
apply plugin: 'com.android.application'

android {
    compileSdkVersion 26
    defaultConfig {
        applicationId "${packageName}"
        minSdkVersion 22
        targetSdkVersion 26
        versionCode 1
        versionName "1.0"
        testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"
    }
    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
}

dependencies {
    implementation fileTree(include: ['*.jar'], dir: 'libs')
    compile 'com.github.bumptech.glide:glide:3.7.0'
    compile 'com.squareup.okhttp3:okhttp:3.6.0'
    compile 'org.jsoup:jsoup:1.11.2'
    compile 'io.reactivex:rxjava:1.0.14'
    compile 'io.reactivex:rxandroid:1.0.1'
    //noinspection GradleCompatible
    implementation 'com.android.support:appcompat-v7:26.1.0'
    testImplementation 'junit:junit:4.12'
    androidTestImplementation 'com.android.support.test:runner:1.0.1'
    androidTestImplementation 'com.android.support.test.espresso:espresso-core:3.0.1'
    implementation 'com.android.support:cardview-v7:26.1.0'
    implementation 'com.android.support:recyclerview-v7:26.1.0'
    implementation 'com.android.support:design:26.1.0'
}
