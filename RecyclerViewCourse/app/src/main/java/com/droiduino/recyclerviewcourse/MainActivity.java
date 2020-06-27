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

        // Instantiate UI
        RecyclerView recyclerView = findViewById(R.id.deviceList);

        // Setting Up RecyclerView
        recyclerView.setLayoutManager(new LinearLayoutManager(this));

        // Connect RecyclerView to the List Adapter
        ListAdapter listAdapter = new ListAdapter(deviceList);
        recyclerView.setAdapter(listAdapter);

    }
}