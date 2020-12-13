package com.example.booking;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.database.Cursor;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.util.Log;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
    DatabaseHelper databaseHelper;
    RequestQueue requestQueue;
    Context context = this;
    ArrayList<Booking> bookingArrayList=new ArrayList<Booking>();
    private final String URL = "http://10.0.2.2/connections/android/get_user.php";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //Calls the database
        databaseHelper = new DatabaseHelper(this);
        Log.d("console","After database helper");

        //POST version
        requestQueue = Singleton.getInstance(this.getApplicationContext()).getRequestQueue();
        StringRequest stringRequest = new StringRequest(Request.Method.POST, URL,
                new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    //gets data from online database
                    JSONArray res = new JSONArray(response);
                    for(int i=0;i<res.length();i++){
                        JSONObject jsonObject = res.getJSONObject(i);
                        Log.d("console",String.valueOf(jsonObject));
                        BigInteger check_in = new BigInteger(jsonObject.getString("check_in"));
                        BigInteger check_out = new BigInteger(jsonObject.getString("check_out"));

                        Booking booking = new Booking(jsonObject.getInt("booking_id"),
                                jsonObject.getInt("room_id"),
                                jsonObject.getInt("guest_ref"),
                                jsonObject.getInt("room_qty"),
                                check_in,
                                check_out,
                                jsonObject.getString("room_name"),
                                (float) jsonObject.getDouble("total"));

                        bookingArrayList.add(booking);
                    }
                    //gets data from local database and inserts the data from online
                    Cursor data = databaseHelper.getBookings();
                    if(data.getCount()==0){
                        for(int i=0;i<bookingArrayList.size();i++){
                            int booking_id = bookingArrayList.get(i).getBooking_id();
                            int room_id = bookingArrayList.get(i).getRoom_id();
                            int guest_ref = bookingArrayList.get(i).getGuest_ref();
                            int room_qty = bookingArrayList.get(i).getRoom_qty();

                            //need to cast as int for bigint in database
                            BigInteger check_in = bookingArrayList.get(i).getCheck_in();
                            BigInteger check_out = bookingArrayList.get(i).getCheck_out();

                            String room_name=bookingArrayList.get(i).getRoom_name();
                            float total = bookingArrayList.get(i).getTotal();

                            databaseHelper.insertBookings(booking_id,room_id,guest_ref,
                                    room_qty,check_in,check_out,room_name,total);

                        }
                        bookingArrayList.clear();
//                        Log.d("console","There are "+data.getCount());
                    }else{
                        databaseHelper.checkDuplicate(bookingArrayList);
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("console",error.toString()+" rows of data.");
            }
        }){
            @Override
            protected Map<String, String> getParams()  {
                Map<String,String> params = new HashMap<>();
                params.put("guest_ref","34");
                return params;
            }
        };
        //Below grabs the data from online db
//        requestQueue = Singleton.getInstance(this.getApplicationContext()).getRequestQueue();
//        StringRequest stringRequest = new StringRequest(Request.Method.GET, URL, new Response.Listener<String>() {
//            @Override
//            public void onResponse(String response) {
//                try {
//                    //gets data from online database
//                    JSONArray res = new JSONArray(response);
//                    for(int i=0;i<res.length();i++){
//                        JSONObject jsonObject = res.getJSONObject(i);
//                        //34 is the member_id
//                        if(jsonObject.getInt("guest_ref")!=34){
//                            Log.d("console","guest_ref "+
//                                    jsonObject.getInt("guest_ref")+" skipped.");
//                            continue;
//                        }else{
//                            BigInteger check_in = new BigInteger(jsonObject.getString("check_in"));
//                            BigInteger check_out = new BigInteger(jsonObject.getString("check_out"));
//
//                            Booking booking = new Booking(jsonObject.getInt("booking_id"),
//                                    jsonObject.getInt("room_id"),
//                                    jsonObject.getInt("guest_ref"),
//                                    jsonObject.getInt("room_qty"),
//                                    check_in,
//                                    check_out,
//                                    jsonObject.getString("room_name"),
//                                    (float) jsonObject.getDouble("total"));
//                            bookingArrayList.add(booking);
//                        }
//
//                    }
//                    //gets data from local database and inserts the data from online
//                    Cursor data = databaseHelper.getBookings();
//                    if(data.getCount()==0){
//                        for(int i=0;i<bookingArrayList.size();i++){
//                            int booking_id = bookingArrayList.get(i).getBooking_id();
//                            int room_id = bookingArrayList.get(i).getRoom_id();
//                            int guest_ref = bookingArrayList.get(i).getGuest_ref();
//                            int room_qty = bookingArrayList.get(i).getRoom_qty();
//
//                            //need to cast as int for bigint in database
//                            BigInteger check_in = bookingArrayList.get(i).getCheck_in();
//                            BigInteger check_out = bookingArrayList.get(i).getCheck_out();
//
//                            String room_name=bookingArrayList.get(i).getRoom_name();
//                            float total = bookingArrayList.get(i).getTotal();
//
//                            databaseHelper.insertBookings(booking_id,room_id,guest_ref,
//                                    room_qty,check_in,check_out,room_name,total);
//
//                        }
//                        bookingArrayList.clear();
////                        Log.d("console","There are "+data.getCount());
//                    }else{
//                        databaseHelper.checkDuplicate(bookingArrayList);
//                    }
//
//                } catch (JSONException e) {
//                    e.printStackTrace();
//                }
//
//            }
//        }, new Response.ErrorListener() {
//            @Override
//            public void onErrorResponse(VolleyError error) {
//                Log.d("console",error.toString()+" rows of data.");
//            }
//        });
        Singleton.getInstance(this).addToRequestQueue(stringRequest);
    }
}
