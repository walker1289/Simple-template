package ${packageName};

import android.os.Bundle;
import android.support.v4.widget.NestedScrollView;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import ${packageName}.control.FragmentControl;
import ${packageName}.control.xj;
import ${packageName}.fragment.Bbs;
import ${packageName}.fragment.Main;
import ${packageName}.fragment.My;
import ${packageName}.interface_.ViewInject;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    private FrameLayout fl;
    public ArrayList mList;
    @ViewInject(R.id.main_tv)
    public TextView tv;
    public int dex=0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        initData();
        tv.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dex++;
                dex=dex==3?0:dex;
                FragmentControl.show(dex);
            }
        });
    }

    private void initData() {
        fl=findViewById(R.id.main_con);
        //初始化数据
        xj.init(getApplication());
        xj.inject(this, (View) fl.getParent());
        mList=FragmentControl.init(getFragmentManager());
        mList.add(new Main());
        mList.add(new Bbs());
        mList.add(new My());
        FragmentControl.commit();
    }


}
