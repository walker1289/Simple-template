package ${packageName}.fragment;

import android.app.Fragment;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.control.xj;
import ${packageName}.interface_.ViewInject;


public class My extends Fragment {
    @ViewInject(R.id.my_tv)
    public TextView tv;
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.my_layout,container,false);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        xj.inject(this,view);
        tv.setText("My Page");
        super.onViewCreated(view, savedInstanceState);
    }
}
