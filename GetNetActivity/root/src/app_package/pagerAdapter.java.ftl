package ${packageName}.adapter;

import android.content.Context;
import android.support.v4.view.PagerAdapter;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import ${packageName}.R;
import ${packageName}.control.xj;

import org.jsoup.select.Elements;


public class pagerAdapter extends PagerAdapter {
    private Context con;
    private Elements elements;
    public pagerAdapter(Context con, Elements elements) {
        this.con = con;
        this.elements=elements;
    }

    @Override
    public int getCount() {
        return elements!=null?elements.size():0;
    }

    @Override
    public boolean isViewFromObject(View view, Object object) {
        return view==object;
    }

    @Override
    public Object instantiateItem(ViewGroup container, int position) {
        ImageView v= (ImageView) View.inflate(con, R.layout.top_item,null);
        xj.loadImage(elements.eq(position).attr("src"),v);
        container.addView(v);
        return v;
    }

    @Override
    public void destroyItem(ViewGroup container, int position, Object object) {
        container.removeView((View) object);
    }
}
