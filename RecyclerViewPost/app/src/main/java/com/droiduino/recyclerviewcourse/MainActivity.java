package com.droiduino.recyclerviewcourse;

import androidx.appcompat.app.AppCompatActivity;
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
        ArrayList<String> headline = new ArrayList<>();
        headline.add("Why some Japanese feel like foreigners in their own country");
        headline.add("Swiss set to vote on immigration");
        headline.add("Navalny out of hospital after poisoning");
        headline.add("Chinese state media slams 'dirty' TikTok deal");
        headline.add("Cindy McCain endorses Biden");
        headline.add("This EU country relies on coal for 80 percent of domestic energy");
        headline.add("India and China come to agreement to stabilize tensions at disputed border");
        headline.add("Teen accused of Tessa Majors' murder allegedly confessed to dad on recorded line");
        headline.add("Fight over Supreme Court already shaking up Senate races");
        headline.add("53-year-old charged for allegedly yelling racial slur and throwing glass bottle at jogger");
        headline.add("Huawei says 'survival is the goal'");
        headline.add("Duke and Duchess of Sussex weigh in on upcoming US election");
        headline.add("Court sentences two men to death after ruling a fire that killed 260 people was arson");
        headline.add("This data is ringing 'alarm bells'");
        headline.add("Have sex, live longer, heart attack victims told");
//        headline.add("Device16");
//        headline.add("Device17");
//        headline.add("Device18");
//        headline.add("Device19");
//        headline.add("Device20");

        // Instantiate UI
        RecyclerView recyclerView = findViewById(R.id.recyclerView);

        // Setting Up RecyclerView
        recyclerView.setLayoutManager(new LinearLayoutManager(this));

        // Connect RecyclerView to the List Adapter
        ListAdapter listAdapter = new ListAdapter(headline);
        recyclerView.setAdapter(listAdapter);

    }
}