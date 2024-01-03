package com.example.contacty;

import android.os.Bundle;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import android.provider.CallLog;
import android.database.Cursor;
import android.content.Context;
import android.provider.ContactsContract;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import android.util.Log; 




public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.native.contacty";
    public class GlobalExceptionHandler implements Thread.UncaughtExceptionHandler {
    private Thread.UncaughtExceptionHandler defaultUEH;

    public GlobalExceptionHandler() {
        this.defaultUEH = Thread.getDefaultUncaughtExceptionHandler();
    }

    @Override
    public void uncaughtException(Thread thread, Throwable throwable) {
        if (throwable instanceof SecurityException) {
            Log.e("GlobalExceptionHandler", "SecurityException captured", throwable);
        } else {
            defaultUEH.uncaughtException(thread, throwable);
        }
    }
}
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Thread.setDefaultUncaughtExceptionHandler(new GlobalExceptionHandler());
    }

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler(
                (call, result) -> {
                    if (call.method.equals("getAllCallLogs")) {
                        List<HashMap<String, Object>> callLogs = getAllCallLogs();
                        if (callLogs != null) {
                            result.success(callLogs);
                        } else {
                            result.error("UNAVAILABLE", "Call logs not available.", null);
                        }
                    } else {
                        result.notImplemented();
                    }
                }
            );
    }

    private List<HashMap<String, Object>> getAllCallLogs() {
        List<HashMap<String, Object>> callLogsList = new ArrayList<>();
        Cursor cursor = null;
        try {
            cursor = getContentResolver().query(CallLog.Calls.CONTENT_URI, null, null, null, null);
            int number = cursor.getColumnIndex(CallLog.Calls.NUMBER);
            int type = cursor.getColumnIndex(CallLog.Calls.TYPE);
            int idIndex = cursor.getColumnIndex(ContactsContract.Contacts._ID);
            int date = cursor.getColumnIndex(CallLog.Calls.DATE);
            int duration = cursor.getColumnIndex(CallLog.Calls.DURATION);

            while (cursor.moveToNext()) {
                HashMap<String, Object> callLog = new HashMap<>();
                callLog.put("number", cursor.getString(number));
                callLog.put("type", cursor.getInt(type));
                callLog.put("date", cursor.getLong(date));
                callLog.put("id", cursor.getString(idIndex));
                callLog.put("duration", cursor.getLong(duration));

                callLogsList.add(callLog);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
        return callLogsList;
    }
}
