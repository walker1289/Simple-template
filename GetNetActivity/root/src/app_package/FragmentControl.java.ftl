package ${packageName}.control;

import android.app.Fragment;
import android.app.FragmentManager;

import ${packageName}.R;

import java.util.ArrayList;

public class FragmentControl {
    private static ArrayList<Fragment> list=new ArrayList<Fragment>();
    private static FragmentManager fm;
    private static int lastIndex=0;
    //初始化
    public static ArrayList<Fragment> init(FragmentManager fragmentManager){
        fm=fragmentManager;
        return list;
    }
    //展示Fragment
    public static void show(int index){

        fm.beginTransaction().hide(list.get(lastIndex)).show(list.get(index)).commit();
        lastIndex=index;
    }

    public static void commit() {
        if (fm==null || list==null)
            throw new NullPointerException("Fragment is null or List is null !");
        fm.beginTransaction()
                .add(R.id.main_con,list.get(0))
                .add(R.id.main_con,list.get(1))
                .add(R.id.main_con,list.get(2))
                .commit();
        for (int i=1;i<list.size();i++){
            fm.beginTransaction().hide(list.get(i)).commit();
        }

    }
}
