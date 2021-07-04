package com.droiduino.recyclerviewpost;

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

        // Dummy News Headlines
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

        // Dummy News Snippets
        String newsSnippet = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut " +
                "labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut " +
                "aliquip ex ea commodo consequat. ";


        // Instantiate RecyclerView
        RecyclerView recyclerView = findViewById(R.id.recyclerView);

        // Setting Up RecyclerView
        recyclerView.setLayoutManager(new LinearLayoutManager(this));

        // Connect RecyclerView to the List Adapter and Data Sources
        ListAdapter listAdapter = new ListAdapter(headline,newsSnippet);

        // Display the RecyclerView
        recyclerView.setAdapter(listAdapter);

    }
}