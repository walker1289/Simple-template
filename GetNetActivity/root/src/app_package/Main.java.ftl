package ${packageName}.fragment;


import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.Nullable;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.adapter.RecyclerAdapter;
import ${packageName}.adapter.pagerAdapter;
import ${packageName}.control.xj;
import ${packageName}.interface_.ViewInject;
import ${packageName}.utils.GetData;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import rx.Subscriber;
import rx.functions.Action1;

public class Main extends Fragment{
    private int index=0;
    @ViewInject(R.id.home_vp)
    private ViewPager vp;
    @ViewInject(R.id.home_rv)
    private RecyclerView rv;
    private Elements elements;
    private Document doc;
    private Runnable runn;
    private boolean flag=true;
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.home_layout,container,false);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        xj.inject(this,view);
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        GetData.get("https://v.zsczys.com/").subscribe(
            new Action1<String>() {
            @Override
            public void call(String s) {
                doc=Jsoup.parse(s);
                elements = doc.select("div.carousel-inner div img");
                doData();
            }
        },
            new Action1<Throwable>() {
            @Override
            public void call(Throwable throwable) {
                Log.d("msg",throwable.getMessage());
            }
        });

    }

    public void doData(){
        Activity activity=getActivity();
        vp.setOffscreenPageLimit(4);
        PagerAdapter pa=new pagerAdapter(activity,elements);
        vp.setAdapter(pa);
        RecyclerAdapter ra=new RecyclerAdapter(activity,doc.select("div.imgBox"));
        GridLayoutManager glm=new GridLayoutManager(getActivity(),2, LinearLayoutManager.VERTICAL,false);
        glm.setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() {
            @Override
            public int getSpanSize(int position) {
                if (position==0)
                    return 2;
                return 1;
            }
        });
        rv.setLayoutManager(glm);
        rv.setAdapter(ra);
        start();
    }

    public void start(){
        final Handler pageHandler = new Handler() {
            @Override
            public void handleMessage(Message msg) {
                vp.setCurrentItem(msg.what);
                super.handleMessage(msg);
            }
        };
       runn =new Runnable() {

            @Override
            public void run() {

                if (flag) {
                    index = index + 1;
                    if (index == elements.size()) {
                        index = index - 1;
                        flag=!flag;
                    }
                }
                if (!flag){
                    index = index - 1;
                    if (index == -1) {
                        index = index + 1;
                        flag=!flag;
                    }
                }
                pageHandler.sendEmptyMessage(index);
                // 在run()方法内调用自身，这样就可以实现循环
                pageHandler.postDelayed(runn, 2500);
            }
        };
        pageHandler.postDelayed(runn,2500);
    }
}
