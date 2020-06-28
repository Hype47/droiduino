package com.droiduino.recyclerviewcourse;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Data
        ArrayList<String> deviceList = new ArrayList<>();
        deviceList.add("Device01");
        deviceList.add("Device02");
        deviceList.add("Device03");
        deviceList.add("Device04");
        deviceList.add("Device05");
        deviceList.add("Device06");
        deviceList.add("Device07");
        deviceList.add("Device08");
        deviceList.add("Device09");
        deviceList.add("Device10");
        deviceList.add("Device11");
        deviceList.add("Device12");
        deviceList.add("Device13");
        deviceList.add("Device14");
        deviceList.add("Device15");
        deviceList.add("Device16");
        deviceList.add("Device17");
        deviceList.add("Device18");
        deviceList.add("Device19");
        deviceList.add("Device20");

        // Instantiate UI
        RecyclerView recyclerView = findViewById(R.id.deviceList);

        // Setting Up RecyclerView
        recyclerView.setLayoutManager(new LinearLayoutManager(this));

        // Connect RecyclerView to the List Adapter
        ListAdapter listAdapter = new ListAdapter(deviceList);
        recyclerView.setAdapter(listAdapter);

    }
}