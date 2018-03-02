<manifest xmlns:android="http://schemas.android.com/apk/res/android" >

	<uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

    <application>
		<activity android:name="${packageName}.${activityClass}"
			<#if isNewProject>
				android:label="@string/app_name"
				android:icon="@mipmap/ic_launcher"
				android:roundIcon="@mipmap/ic_launcher_round"
				android:theme="@style/AppTheme"
				</#if>>
				<intent-filter>
					<action android:name="android.intent.action.MAIN" />
					<category android:name="android.intent.category.LAUNCHER" />
				</intent-filter>
			</activity>
    </application>
</manifest>
