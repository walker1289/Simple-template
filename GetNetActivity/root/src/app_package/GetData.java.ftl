package ${packageName}.utils;



import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import rx.Observable;
import rx.Subscriber;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;


public  class GetData {
    public static Observable<String> get(final String url){
        return Observable.create(new Observable.OnSubscribe<String>() {
            @Override
            public void call(final Subscriber<? super String> subscriber) {
                OkHttpClient client=new OkHttpClient();
                final Request request=new Request.Builder().removeHeader("User-Agent").addHeader("User-Agent",
                        System.getProperty("http.agent")).url(url).build();
                client.newCall(request).enqueue(new Callback() {
                    @Override
                    public void onFailure(Call call, IOException e) {
                        subscriber.onError(e);
                    }

                    @Override
                    public void onResponse(Call call, Response response) throws IOException {
                        if (response.isSuccessful()){
                            String res=new String(response.body().bytes());
                            subscriber.onNext(res);
                            /*try {
                                FileOutputStream fin= new FileOutputStream(new File("/sdcard/aa.html"));
                                fin.write(res.getBytes());
                                fin.close();
                            }catch (IOException o){
                                o.printStackTrace();
                            }*/

                        }
                    }
                });
            }
        }).observeOn(AndroidSchedulers.mainThread()).subscribeOn(Schedulers.io());
    }
}
