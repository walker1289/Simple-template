<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:orientation="vertical"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context="${packageName}.MainActivity">
    <FrameLayout
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1"
        android:id="@+id/main_con"/>
    <TextView
        android:id="@+id/main_tv"
        android:layout_width="match_parent"
        android:layout_height="50dp"
        android:gravity="center"
        android:layout_gravity="bottom"
        android:background="#0ff"
        android:text="这是底部栏"/>
</LinearLayout>
