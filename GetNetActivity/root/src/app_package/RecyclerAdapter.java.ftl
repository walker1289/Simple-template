package ${packageName}.adapter;

import android.content.Context;
import android.content.IntentFilter;
import android.sax.Element;
import android.support.design.widget.CoordinatorLayout;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.control.xj;

import org.jsoup.select.Elements;


public class RecyclerAdapter extends RecyclerView.Adapter {
    private Context context;
    private Elements sub_title,sub_mo,sub_ma;
    private int pos=0;
    private String titl="热门经典/最新电影/最新电视/最新美剧";

    @Override
    public String toString() {
        return "RecyclerAdapter{" +
                "sub_title=" + sub_title +
                ", sub_mo=" + sub_mo +
                ", sub_ma=" + sub_ma +
                '}';
    }

    public RecyclerAdapter(Context context, Elements select) {
        this.context = context;
        this.sub_title=select.select("div.Sub_H2");//类型
        this.sub_mo=select.select("div.col_2");//热门经典
        this.sub_ma=select.select("div.col_3_2");
        Log.d("msg",this.toString());
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        if (viewType==1)
            return new TViewHolder(LayoutInflater.from(context).inflate(R.layout.main_rv_item,parent,false));
        else if (viewType==2)
            return new IViewHolder1(LayoutInflater.from(context).inflate(R.layout.main_rv_item_1,parent,false));
        return new IViewHolder(LayoutInflater.from(context).inflate(R.layout.main_rv_item_,parent,false));
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        if (holder instanceof TViewHolder){
            ((TViewHolder) holder).tv.setText(sub_title.eq(0).select("span.Title").text());
            xj.loadImage("https://v.zsczys.com"+sub_title.eq(0).select("img").attr("src"),((TViewHolder) holder).ig);
        }//0 5 14 25 36
//        else if (holder instanceof IViewHolder){
//            if (position<5){
//
//                xj.loadImage(e1.select("div.movie-item-in img").eq(position-1).attr("src"),((IViewHolder) holder).ig);
//                ((IViewHolder) holder).title.setText(e1.select("div.movie-item-in h1 a").eq(position-1).text());
//            }
//        }
//        else if (holder instanceof IViewHolder1){
//            xj.loadImage(e2.eq(position-1).attr("src"),((IViewHolder1) holder).ig);
//            ((IViewHolder1) holder).title.setText(e2.eq(position-1).attr("title"));
//        }
    }

    @Override
    public int getItemViewType(int position) {
        if (position==0)
            return 1;
        else if (position>5)
            return 2;
        return 0;
    }

    @Override
    public int getItemCount() {
        return 42+5;
    }
    //标题，内容
    class TViewHolder extends RecyclerView.ViewHolder{
        public TextView tv;
        public ImageView ig;
        public TViewHolder(View itemView) {
            super(itemView);
            tv=itemView.findViewById(R.id.item_sum);
            ig=itemView.findViewById(R.id.item_sum_ig);
        }
    }
    class IViewHolder extends RecyclerView.ViewHolder{
        public TextView title;
        public ImageView ig;
        public IViewHolder(View itemView) {
            super(itemView);
            title=itemView.findViewById(R.id.rv_title);
            ig=itemView.findViewById(R.id.rv_ig);
        }
    }
    class IViewHolder1 extends RecyclerView.ViewHolder{
        public TextView title;
        public ImageView ig;
        public IViewHolder1(View itemView) {
            super(itemView);
            title=itemView.findViewById(R.id.rv_title);
            ig=itemView.findViewById(R.id.rv_ig);
        }
    }
}
