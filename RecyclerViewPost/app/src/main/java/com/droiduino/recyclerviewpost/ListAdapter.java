package com.droiduino.recyclerviewpost;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class ListAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    // Declaring the inputs for the Adapter class
    private ArrayList<String> newsHeadlines;
    private String newsSnippet;

    // Instantiate the UI Elements from the Content Layout
    public static class ViewHolder extends RecyclerView.ViewHolder{
        TextView textView,textBody;
        public ViewHolder(View view){
            super(view);
            textView = view.findViewById(R.id.textTitle);
            textBody = view.findViewById(R.id.textBody);
        }
    }

    // Construct the Primary method for this class and determine its mandatory inputs
    public ListAdapter(ArrayList<String> newsHeadlines,String newsSnippet){
        this.newsHeadlines = newsHeadlines;
        this.newsSnippet = newsSnippet;
    }

    // Inflate the Content Layout
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType){
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_layout, parent, false);
        ViewHolder viewHolder = new ViewHolder(view);
        return viewHolder;
    }

    // Bind or assign the data elements to the UI Elements
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position){
        // Get content of Device List
        String deviceName = newsHeadlines.get(position);

        // Assign the content to each RecyclerView row
        ViewHolder itemHolder = (ViewHolder) holder;
        itemHolder.textView.setText(deviceName);
        itemHolder.textBody.setText(newsSnippet);
    }

    // Getting the Data Source size
    public int getItemCount(){
        int count = newsHeadlines.size();
        return count;
    }


}
