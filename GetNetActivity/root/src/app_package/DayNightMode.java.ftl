package ${packageName}.utils;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import ${packageName}.R;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2018/3/2.
 */

public class DayNightMode {
        //所有要更改颜色的View
        private static List<View> view;
        private static boolean flag=true;
        public static void addView(View...views){
            if (view==null){
                view=new ArrayList<View>();
            }
            for (int i=0;i<views.length;i++){
                view.add(views[i]);
            }
        }


        public static void refreshUi(Activity activity){
            //分别定制两套样式（日间和夜晚）
            /*if (flag)
                activity.setTheme(R.style.NightTheme);
            else
                //activity.setTheme(R.style.DayTheme);
            flag=!flag;
            */
            TypedValue background=new TypedValue();  //背景色
            TypedValue textcolor=new TypedValue();   //字体颜色
            Resources.Theme theme=activity.getTheme();
            //自定义属性
            //theme.resolveAttribute(R.attr.xjBackground,background,true);
            //theme.resolveAttribute(R.attr.xjTextColor,textcolor,true);

            if (view!=null) {
                for (View v : view) {
                    if (v instanceof TextView)
                        ((TextView)v).setTextColor(activity.getResources().getColor(textcolor.resourceId));
                    else
                        v.setBackgroundResource(background.resourceId);
                }
            }
            //刷新状态栏的颜色
            if (Build.VERSION.SDK_INT >= 21) {
                TypedValue typedValue = new TypedValue();
                Resources.Theme theme1 = activity.getTheme();
                theme1.resolveAttribute(R.attr.colorPrimary, typedValue, true);
                activity.getWindow().setStatusBarColor(activity.getResources().getColor(typedValue.resourceId));
            }

        }

        //过渡动画
        private static void showAnimation(Activity activity){
            final View decorView=activity.getWindow().getDecorView();
            Bitmap cacheBitmap=getCacheBitmap(decorView);
            if (decorView instanceof ViewGroup && cacheBitmap!=null){
                final View vi=new View(activity);
                vi.setBackgroundDrawable(new BitmapDrawable(activity.getResources(),cacheBitmap));
                ViewGroup.LayoutParams para=new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
                ((ViewGroup) decorView).addView(vi);
                ObjectAnimator objectAnimator = ObjectAnimator.ofFloat(vi, "alpha", 1f, 0f);
                objectAnimator.setDuration(300);
                objectAnimator.addListener(new AnimatorListenerAdapter() {
                    @Override
                    public void onAnimationEnd(Animator animation) {
                        super.onAnimationEnd(animation);
                        ((ViewGroup) decorView).removeView(vi);
                    }
                });
                objectAnimator.start();
            }
        }

        //获取截屏图片
        private static Bitmap getCacheBitmap(View v){
            v.setDrawingCacheEnabled(true);
            v.buildDrawingCache(true);
            final Bitmap bitmap=v.getDrawingCache();
            Bitmap bit;
            if (bitmap!=null){
                bit=Bitmap.createBitmap(bitmap);
                v.setDrawingCacheEnabled(false);
            }
            else {
                bit=null;
            }
            return bit;
        }

}
