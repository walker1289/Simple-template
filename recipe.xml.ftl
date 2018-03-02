<?xml version="1.0"?>
<recipe>
	<dependency mavenUrl="com.android.support:appcompat-v7:26.1.0"/>
    <dependency mavenUrl="com.android.support:cardview-v7:26.1.0"/>
    <dependency mavenUrl="com.android.support:recyclerview-v7:26.1.0"/>
	<dependency mavenUrl="com.android.support:design:26.1.0"/>
    <dependency mavenUrl="com.squareup.okhttp3:okhttp:3.6.0"/>
    <dependency mavenUrl="com.github.bumptech.glide:glide:3.7.0"/>
	<dependency mavenUrl="org.jsoup:jsoup:1.11.2"/>
    <dependency mavenUrl="io.reactivex:rxjava:1.0.14"/>
    <dependency mavenUrl="io.reactivex:rxandroid:1.0.1"/>
	<copy from="root/res/drawable"
                to="${escapeXmlAttribute(resOut)}/drawable" />
	
    <merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
			 
	<merge from="root/res/values/dimens.xml"
             to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
			 
	<merge from="root/res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
			 
	<merge from="root/res/values/styles.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/styles.xml" />
			 
    <merge from="root/res/values/colors.xml"
             to="${escapeXmlAttribute(resOut)}/values/colors.xml" />

			 
	<merge from="root/res/layout/bbs_layout.xml"
             to="${escapeXmlAttribute(resOut)}/layout/bbs_layout.xml" />
			 
	<merge from="root/res/layout/home_layout.xml"
             to="${escapeXmlAttribute(resOut)}/layout/home_layout.xml" />
			 
	<merge from="root/res/layout/top_item.xml"
             to="${escapeXmlAttribute(resOut)}/layout/top_item.xml" />
			 
	<merge from="root/res/layout/my_layout.xml"
             to="${escapeXmlAttribute(resOut)}/layout/my_layout.xml" />
			 
	<merge from="root/res/layout/main_rv_item_1.xml"
             to="${escapeXmlAttribute(resOut)}/layout/main_rv_item_1.xml" />
			 
	<merge from="root/res/layout/main_rv_item_.xml"
             to="${escapeXmlAttribute(resOut)}/layout/main_rv_item_.xml" />
			 
	<merge from="root/res/layout/main_rv_item.xml"
             to="${escapeXmlAttribute(resOut)}/layout/main_rv_item.xml" />		 
			 
    <instantiate from="root/res/layout/activity_login.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   

    <instantiate from="root/src/app_package/MainActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
   <!--fragment-->
   <instantiate from="root/src/app_package/Bbs.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/fragment/Bbs.java" />
				   
   <instantiate from="root/src/app_package/Main.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/fragment/Main.java" />
				   
	<instantiate from="root/src/app_package/My.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/fragment/My.java" />
   <!--control-->
   <instantiate from="root/src/app_package/FragmentControl.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/control/FragmentControl.java" />
				   
   <instantiate from="root/src/app_package/xj.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/control/xj.java" />
	<!--utils-->
	<instantiate from="root/src/app_package/GetData.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/GetData.java" />
   <instantiate from="root/src/app_package/DayNightMode.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/utils/DayNightMode.java" />
	<!--interface_-->
	<instantiate from="root/src/app_package/ViewInject.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/interface_/ViewInject.java" />
	<!--adapter-->
	<instantiate from="root/src/app_package/pagerAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/adapter/pagerAdapter.java" />
	<instantiate from="root/src/app_package/RecyclerAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/adapter/RecyclerAdapter.java" />
	<!--view-->		
	<instantiate from="root/src/app_package/CircleImageView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/view/CircleImageView.java" />
				   
    <open file="${escapeXmlAttribute(srcOut)}/control/${activityClass}.java" />

</recipe>
