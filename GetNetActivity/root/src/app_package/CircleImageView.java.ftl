package ${packageName}.view;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.util.AttributeSet;

//圆形图片
public class CircleImageView extends android.support.v7.widget.AppCompatImageView {

    public CircleImageView(Context context) {
        super(context);
    }

    public CircleImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public CircleImageView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override
    protected void onDraw(Canvas canvas){
        //初始化数据
        BitmapDrawable drawable = ((BitmapDrawable) getDrawable());
        //如果图片资源不为空、控件长宽不一致时执行，否则抛出异常
        if (drawable!=null && getWidth()==getHeight()){
            Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
            Bitmap bitmap1=drawable.getBitmap();
            Matrix matrix=new Matrix();
            //获得圆形头像的第一种方法（clippath） 圆形图片糊边
//            matrix.setScale((float)getWidth()/bitmap1.getWidth(),(float)getHeight()/bitmap1.getHeight());
//            path.addCircle(getWidth()/2,getHeight()/2,getWidth()/2, Path.Direction.CW);
//            canvas.clipPath(path);
//            canvas.drawBitmap(bitmap1,matrix,paint);
//
//            paint.setStyle(Paint.Style.STROKE);
//            paint.setStrokeWidth(2);
//            canvas.drawCircle(getWidth()/2,getHeight()/2,getWidth()/2-1,paint);
//            canvas.restore();

            //第二种方法(使用BitmapShader 、 drawCircle 、 Matrix)
            matrix.setScale((float)getWidth()/bitmap1.getWidth(),(float)getHeight()/bitmap1.getHeight());
            Shader shader=new BitmapShader(bitmap1, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
            shader.setLocalMatrix(matrix);
            paint.setShader(shader);
            canvas.drawCircle(getWidth()/2,getHeight()/2,getWidth()/2,paint);
            paint.setShader(null);
            //画边框黑边
            paint.setStyle(Paint.Style.STROKE);
            paint.setColor(Color.BLACK);
            paint.setStrokeWidth(1);
            canvas.drawCircle(getWidth()/2,getHeight()/2,getWidth()/2-1,paint);

        }
        else
            try {
                throw new RunTimeException("No image resource or View's height and width are not same !");
            } catch (ViewException e) {
                e.printStackTrace();
            }


    }
    
}
