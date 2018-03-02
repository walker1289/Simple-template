package ${packageName}.control;


import android.app.Activity;
import android.app.ActivityManager;
import android.app.Application;
import android.app.Fragment;
import android.content.Context;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import ${packageName}.R;
import ${packageName}.interface_.ViewInject;

import java.lang.reflect.Field;

public class xj {
    public static Context context;

    /**
     * 初始化
     * @param application
     */
    public static void init(Application application){
        context=application.getApplicationContext();
    }
    /**
     *
     * @param object 用于Activity
     * @param view
     */

    public static void inject(Object object, View view){
        Test("inject");
        Class cla=object.getClass();
        Field[] fields = cla.getDeclaredFields();
        for (Field field:fields){
            if (!field.isAccessible())
                field.setAccessible(true);
            ViewInject vi = field.getAnnotation(ViewInject.class);
            if (vi!=null){
                try {
                    field.set(object,view.findViewById(vi.value()));
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        }
        Test("inject");
    }

    /**
     * 加载图片
     * @param url 图片地址
     * @param ig
     */
    public static void loadImage(String url, ImageView ig){
        if (context==null)
            throw new RuntimeException(" Not init !");
        else
            Glide.with(context)
                    .load(url)
                    //.placeholder(R.drawable.loading)  //加载完成之前的默认图片
                    //缓存转换后的图片
                    .diskCacheStrategy(DiskCacheStrategy.RESULT)
                    .into(ig);
    }

    public static void Test(String u){
        long l = Runtime.getRuntime().totalMemory();
        Log.d(u+"总",l*1.0/1024.0/1024+"M");
        long l1 = Runtime.getRuntime().maxMemory();
        Log.d(u+"最大",l1*1.0/1024.0/1024+"M");
        long l2 = Runtime.getRuntime().freeMemory();
        Log.d(u+"空闲",l2*1.0/1024.0/1024+"M");
    }
}
